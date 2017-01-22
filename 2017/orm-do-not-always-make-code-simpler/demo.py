import os
import sys
import time

import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship
from sqlalchemy import Column, Integer, Unicode, ForeignKey


COUNT = 100


Base = declarative_base()


class Project(Base):
    __tablename__ = 'project'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, unique=True)
    tasks = relationship('Task', cascade='save-update,merge,delete', backref='project')


class Task(Base):
    __tablename__ = 'task'
    id = Column(Integer, primary_key=True)
    title = Column(Unicode)
    project_id = Column(Integer, ForeignKey('project.id'), nullable=False)


def create_engine():
    echo = os.environ.get("ECHO_SQL", "0") != "0"
    return sqlalchemy.create_engine('sqlite:///:memory:', echo=echo)


def create_session(engine):
    Session = sessionmaker(bind=engine)
    return Session()


def fill_tables(session):
    prj_a = Project(name='A')
    prj_b = Project(name='B')
    for x in range(COUNT):
        Task(title='task-a-{}'.format(x), project=prj_a)
        Task(title='task-b-{}'.format(x), project=prj_b)

    session.add(prj_a)
    session.add(prj_b)


def merge_1(session, src_prj, dst_prj):
    for task in src_prj.tasks:
        task.project = dst_prj
    session.delete(src_prj)


def merge_2(session, src_prj, dst_prj):
    for task in src_prj.tasks:
        task.project_id = dst_prj.id
    session.delete(src_prj)


def merge_3(session, src_prj, dst_prj):
    for task in src_prj.tasks:
        task.project_id = dst_prj.id
    session.delete(src_prj)


def merge_4(session, src_prj, dst_prj):
    session.query(Task).filter_by(project_id=src_prj.id) \
            .update({'project_id': dst_prj.id})
    session.delete(src_prj)


def merge_5(session, src_prj, dst_prj):
    for task in src_prj.tasks:
        task.project_id = dst_prj.id
    session.commit()
    session.delete(src_prj)


def main():
    version = sys.argv[1]
    merge_function = eval('merge_' + version)

    engine = create_engine()
    Base.metadata.create_all(engine)

    session = create_session(engine)
    fill_tables(session)
    session.commit()

    nb_tasks = session.query(Task).count()
    print('before: nb_tasks={} expected={}'.format(nb_tasks, COUNT * 2))
    assert nb_tasks == COUNT * 2

    src_prj = session.query(Project).filter_by(name='A').one()
    dst_prj = session.query(Project).filter_by(name='B').one()
    start = time.time()
    merge_function(session, src_prj, dst_prj)
    elapsed = time.time() - start
    print('duration: {:.3}'.format(elapsed))
    session.commit()

    nb_tasks = session.query(Task).count()
    print('nb_tasks={} expected={}'.format(nb_tasks, COUNT * 2))
    if nb_tasks == COUNT * 2:
        print('OK')
        return 0
    else:
        print('FAIL')
        return 1


if __name__ == '__main__':
    sys.exit(main())
