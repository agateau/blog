# encoding: utf-8
from docutils import nodes
from docutils.core import publish_string
from docutils.parsers.rst import directives, Directive


class HelloWorld(Directive):
    def run(self):
        para = nodes.paragraph(text='Hello World')
        return [para]


class Sections(Directive):
    def run(self):
        section = nodes.section()
        section += nodes.title(text='Hello')
        section += nodes.paragraph(text='Some text.')

        subsection = nodes.section()
        section += subsection

        subsection += nodes.title(text='A Level 2 Title')
        subsection += nodes.paragraph(text='More text.')

        return [section]


class BulletList(Directive):
    def run(self):
        fruits = ['Apples', 'Oranges', 'Bananas']

        lst = nodes.bullet_list()
        for fruit in fruits:
            item = nodes.list_item()
            lst += item
            item += nodes.paragraph(text=fruit)

        return [lst]


class TableExample(Directive):
    def run(self):
        header = ('Product', 'Unit Price', 'Quantity', 'Price')
        colwidths = (2, 1, 1, 1)
        data = [
            ('Coffee', '2', '2', '4'),
            ('Orange Juice', '3', '1', '3'),
            ('Croissant', '1.5', '2', '3'),
        ]

        table = nodes.table()

        tgroup = nodes.tgroup(cols=4)
        table += tgroup
        for colwidth in colwidths:
            tgroup += nodes.colspec(colwidth=colwidth)

        thead = nodes.thead()
        tgroup += thead
        thead += self.create_table_row(header)

        tbody = nodes.tbody()
        tgroup += tbody
        for data_row in data:
            tbody += self.create_table_row(data_row)

        return [table]

    def create_table_row(self, row_cells):
        row = nodes.row()
        for cell in row_cells:
            entry = nodes.entry()
            row += entry
            entry += nodes.paragraph(text=cell)
        return row


RST_CONTENT = """
.. hello_world::

----

.. sections::

----

.. bullet_list::

----

.. table_example::
"""


def main():
    directives.register_directive('hello_world', HelloWorld)
    directives.register_directive('sections', Sections)
    directives.register_directive('bullet_list', BulletList)
    directives.register_directive('table_example', TableExample)

    html = publish_string(source=RST_CONTENT, writer_name='html')
    print(html)


if __name__ == '__main__':
    main()
