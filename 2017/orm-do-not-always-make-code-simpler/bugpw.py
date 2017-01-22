import sys
import time

from peewee import *


# Print all queries to stderr.
import logging
logger = logging.getLogger('peewee')
logger.setLevel(logging.DEBUG)
logger.addHandler(logging.StreamHandler())


COUNT = 100


db = SqliteDatabase(':memory:', autocommit=False)


class Project(Model):
    name = CharField()

    class Meta:
        database = db


class Task(Model):
    title = CharField()
    project = ForeignKeyField(Project, related_name='tasks')

    class Meta:
        database = db


def fill_tables():
    prj_a = Project(name='A')
    prj_a.save()
    prj_b = Project(name='B')
    prj_b.save()
    for x in range(COUNT):
        Task(title='task-a-{}'.format(x), project=prj_a).save()
        Task(title='task-b-{}'.format(x), project=prj_b).save()


def merge_1(src_prj, dst_prj):
    for task in src_prj.tasks:
        task.project = dst_prj
        task.save()
    src_prj.delete_instance()


def merge_2(session, src_prj, dst_prj):
    for task in src_prj.tasks:
        task.project_id = dst_prj.id
    session.delete(src_prj)


def merge_3(session, src_prj, dst_prj):
    for task in src_prj.tasks:
        task.project_id = dst_prj.id
    session.delete(src_prj)


def merge_4(src_prj, dst_prj):
    Task.update(project=dst_prj).where(Task.project == src_prj).execute()
    src_prj.delete_instance()


def merge_5(session, src_prj, dst_prj):
    for task in src_prj.tasks:
        task.project_id = dst_prj.id
    session.commit()
    session.delete(src_prj)


def main():
    version = sys.argv[1]
    merge_function = eval('merge_' + version)

    db.connect()
    db.create_tables([Project, Task])

    with db.atomic():
        fill_tables()

    nb_tasks = Task.select().count()
    print('before: nb_tasks={} expected={}'.format(nb_tasks, COUNT * 2))
    assert nb_tasks == COUNT * 2

    src_prj = Project.get(Project.name == 'A')
    dst_prj = Project.get(Project.name == 'B')
    start = time.time()
    with db.atomic():
        merge_function(src_prj, dst_prj)
    elapsed = time.time() - start
    print('duration: {:.3}'.format(elapsed))

    nb_tasks = Task.select().where(Task.project == dst_prj).count()
    print('nb_tasks={} expected={}'.format(nb_tasks, COUNT * 2))
    if nb_tasks == COUNT * 2:
        print('OK')
        return 0
    else:
        print('FAIL')
        return 1


if __name__ == '__main__':
    sys.exit(main())
