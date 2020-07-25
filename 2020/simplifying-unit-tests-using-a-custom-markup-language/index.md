pub_date: 2020-06-26 15:33:31 +01:00
public: true
tags: [qt, testing, c++, pko]
title: Simplifying unit tests using a custom markup language

Today I want to present a testing technique I now use in [Nanonote][] unit tests.

[Nanonote]: https://github.com/agateau/nanonote

Nanonote main component is a QTextEdit with several "extensions" to provide custom behaviors such as indenting/unindenting selected lines with tab/shift+tab or moving selected lines up and down with alt+shift+arrow keys (next version feature, #spoileralert!).

Testing these extensions is not particularly difficult but it requires tedious setup to set the text, position the cursor, define the selection. Then you perform the action and have to write more tedious code to check the new text, cursor position and selection match your expectations. Not only is it tedious to write, it is also error-prone and hard to read.

<!-- break -->

Here is an example:

```c++
SECTION("indent whole lines") {
    // GIVEN a TextEdit with 3 lines, the first two being selected
    edit->setPlainText("1\n"
                       "2\n"
                       "3\n");
    auto cursor = edit->textCursor();
    cursor.movePosition(QTextCursor::Down, QTextCursor::KeepAnchor, 2);
    edit->setTextCursor(cursor);

    // WHEN I press Tab
    QTest::keyClick(edit, Qt::Key_Tab);

    // THEN the selected lines are indented
    CHECK(edit->toPlainText() == QString("    1\n"
                                         "    2\n"
                                         "3\n"));
    // AND the selected lines are still selected
    CHECK(cursor.selectionStart() == 4);
    CHECK(cursor.selectionEnd() == 12);
}
```

(The `SECTION` and `CHECK` macros come from the [Catch2][] test framework I use to write Nanonote tests)

[Catch2]: https://github.com/catchorg/catch2

To simplify this I created two helper functions. The first one, [setupTextEditContent()][setup], is responsible for setting up a TextEdit in the state I need for my test. It takes a TextEdit instance and a string describing the wanted state in a tiny "markup" language. This language is the text content for the TextEdit with some special characters to define the selection:

- It *must* contain a `|` character to indicate the cursor position.
- It *can* contain a `*` character to indicate the selection start.
- `|` may appear before `*` in the case of an upward selection.

Using this function, we can rewrite our the GIVEN part of our test code like this:

```c++
SECTION("indent whole lines") {
    // GIVEN a TextEdit with 3 lines, the first two being selected
    setupTextEditContent(edit, "*1\n"
                               "2\n"
                               "|3\n");

    // WHEN I press Tab
    QTest::keyClick(edit, Qt::Key_Tab);

    // THEN the selected lines are indented
    CHECK(edit->toPlainText() == QString("    1\n"
                                         "    2\n"
                                         "3\n"));
    // AND the selected lines are still selected
    CHECK(cursor.selectionStart() == 4);
    CHECK(cursor.selectionEnd() == 12);
}
```

The second function, [dumpTextEditContent()][dump], does the opposite: it returns the representation of the TextEdit state using the markup language. It can be used to check the state of the TextEdit instance matches what is expected. Our test code can thus be further simplified into this:

```c++
SECTION("indent whole lines") {
    // GIVEN a TextEdit with 3 lines, the first two being selected
    setupTextEditContent(edit, "*1\n"
                               "2\n"
                               "|3\n");

    // WHEN I press Tab
    QTest::keyClick(edit, Qt::Key_Tab);

    // THEN the selected lines are indented
    // AND the selected lines are still selected
    REQUIRE(dumpTextEditContent(edit) == QString("    *1\n"
                                                 "    2\n"
                                                 "|3\n"));
}
```

As you can see the test code is much shorter and, at least for me, easier to read. Furthermore, in case of failures, the error message shows the difference between the actual and the expected state using the markup language instead of telling you that the cursor position is at 3 instead of the expected 2.

I find this technique makes it a lot less painful to write tests and will look into using it in other places when it makes sense. One drawback to keep in mind though is that the implementation of `setupTextEditContent()` and `dumpTextEditContent()` must not be buggy itself! It might make sense to write tests for those...

That's it for this article, I hope it was useful for you. I doubt I actually invented this technique, so I'd be interested to hear if you have ever used a similar testing technique in your own projects!

[setup]: https://github.com/agateau/nanonote/blob/d42ba1bd7e5c70260fb823df46013fa631b951a8/tests/TextUtils.cpp#L34
[dump]: https://github.com/agateau/nanonote/blob/d42ba1bd7e5c70260fb823df46013fa631b951a8/tests/TextUtils.cpp#L12
