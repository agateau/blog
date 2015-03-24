pub_date: 2015-03-24 23:00:09 +01:00
public: true
tags: [Docutils, Sphinx, rst, Python]
title: "Docutils Snippets"
summary: |
    Some notes and examples of Docutils API usage.

Last week I had to work with [docutils][], a Python library to turn [reStructuredText][rst] (.rst) into documentation. I was using it to extend a [Sphinx][]-based documentation I am setting up. It was quite a frustrating experience: despite loads of search, I could not find any simple, working examples demonstrating Docutils API usage. To save me (and possibly you) some more frustration next time I need to use this library, I am writing down a few examples.

My goal was to create a custom Docutils `Directive`. A `Directive` is a class which can be referred to from a .rst file to generate custom content. Its main method is `run()`, which must return a list of Docutils nodes, representing the custom content. Each node can itself contain other nodes, so `run()` actually returns a list of node trees.

Available nodes are listed in the [Docutils Document Tree][doc-tree]. reStructuredText is powerful and expressive, which means creating simple text structures can require quite a lot of nodes, as we shall see.

Let's start with an "Hello World", a simple paragraph:

.. sourcecode:: python

    from docutils import nodes
    # ...

    class HelloWorld(Directive):
        def run(self):
            para = nodes.paragraph(text='Hello World')
            return [para]

An error I made a lot when starting was to pass the text of the paragraph as a _positional_ argument. I kept writing that:

.. sourcecode:: python

    nodes.paragraph('Hello World')

Instead of this:

.. sourcecode:: python

    nodes.paragraph(text='Hello World')

It does not work because the first argument of `paragraph()` is the raw source: the string which would produce the paragraph if it came from a .rst document.

Next example, let's create some sections, the equivalent of this .rst source:

.. sourcecode:: rst

    Hello
    =====

    Some text.

    A Level 2 Title
    ---------------

    More text.

The code:

.. sourcecode:: python

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

Let's now create a bullet list, like the one which would be created by this .rst:

.. sourcecode:: rst

    - Apples
    - Oranges
    - Bananas

This is done with a `bullet_list` node, which contains `list_item` nodes, which themselves contain `paragraph` nodes.

.. sourcecode:: python

    class BulletList(Directive):
        def run(self):
            fruits = ['Apples', 'Oranges', 'Bananas']

            lst = nodes.bullet_list()
            for fruit in fruits:
                item = nodes.list_item()
                lst += item
                item += nodes.paragraph(text=fruit)

            return [lst]

And now for something a bit crazier, what about a table? The rough equivalent of:

.. sourcecode:: rst

    ============ ========== ======== =====
    Product      Unit Price Quantity Price
    ------------ ---------- -------- -----
    Coffee       2          2        4
    Orange Juice 3          1        3
    Croissant    1.5        2        3
    ============ ========== ======== =====

This one is a bit more involved:

.. sourcecode:: python

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

            tgroup = nodes.tgroup(cols=len(header))
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

That's it for today, hope this was helpful for some of you. If you want to experiment with this, here is the source code for all these examples: [docutils_snippets.py](docutils_snippets.py).

PS: I am no Docutils expert, this article may suggest wrong ways to do things, please leave a comment if you notice any error.

<a href="https://flattr.com/submit/auto?title=Docutils+Snippets&user_id=agateau&description=Some+notes+and+examples+of+Docutils+API+usage.&url=http%3A%2F%2Fagateau.com%2F2015%2Fdocutils-snippets">
<img src="https://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" border="0">
</a>

[docutils]: http://docutils.sourceforge.net
[rst]: http://docutils.sourceforge.net/rst.html
[Sphinx]: http://sphinx-doc.org
[doc-tree]: http://docutils.sourceforge.net/docs/ref/doctree.html
