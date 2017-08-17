title: "Introducing Linguaj"
public: true
pub_date: 2014-03-26 18:53:00 +01:00
tags: [Greenyetilab, burgerparty, dev, translations]


As I mentioned in my post about [Burger Party 0.12][bp-0.12], I put together a gettext-based system to handle translations. This post explains how it works and how you can use it in your own projects.

[bp-0.12]: ../burgerparty-0.12/

## Super Quick Introduction to Gettext

In case you are not familiar with it, here is how gettext works. You start by wrapping all strings you want to make translatable in a `gettext()` function call, like this:

    printf(gettext("Hello, %s\n"), name);

Since this is quite verbose, it is very common in C to create a macro to replace the `gettext()` calls:

    #define _(x) gettext(x)

Which allows to shorten the code to:

    printf(_("Hello, %s\n"), name);

Then you run a tool called `xgettext` on your code. This tool looks through your source for calls to the functions used to mark translatable code and lists all the collected strings in a file named a PO Template (usually with the ".pot" extension). This is a text file with a bit of meta data at the beginning and then a series of lines, one for the original text and another for the translation. It looks like this:

    msgid ""
    msgstr ""
    "Project-Id-Version: PACKAGE VERSION\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2014-03-27 22:46+0100\n"
    "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
    "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
    "Language-Team: LANGUAGE <LL@li.org>\n"
    "Language: \n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=CHARSET\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=INTEGER; plural=EXPRESSION;\n"

    #: src/hello.c:12
    msgid "Hello, %s\n"
    msgstr ""

    #: src/utils.c:24
    msgid "Setting up engine\n"
    msgstr ""
    ...

You can turn this template into a PO for your language (either by copying it and filling the blanks, but preferably with the `msginit` tool). For example to translate our helloworld program to French we would create "helloworld-fr.po" from "helloworld.pot" and translate its content. Translation can be done by hand or using specialized tools like [Poedit][].

[poedit]: http://poedit.sf.net

Now that you have your "helloworld-fr.po", you run it through the `msgfmt` tool to turn your text-based "helloworld-fr.po" file into an optimized, binary "helloworld-fr.mo" file. Once this file is installed at the right place, you need to add another call at the beginning of your program to load it. Now all calls to `_()` return translated strings if they are available.

## Why Gettext Rather than the Java ResourceBundle System?

For two reasons:

The first one is I find it more pleasant to work with real strings in my code than with constants. Especially when the strings contain place holders such as the "Hello, %s\n" string from my example.

The second and more important reason is that the ResourceBundle system does not support plural forms as well as gettext. Plural forms can be tricky: some languages have different plural forms depending on the number of elements to represent, for example Polish uses one plural form when the number is between 2 and 4 and another form when the number is between 5 and 21. Gettext handles this by providing special functions for plural forms.

Again, an example is probably the best way to explain this. Let's borrow it from gettext documentation. Imagine you want to show a number of files. A crude implementation would be something like this:

    printf(_("%d file(s)\n"), nb);

Not very nice, we can change it like this:

    if (nb == 1) {
        printf(_("1 file\n"))
    } else {
        printf(_("%d files\n"), nb);
    }

Works fine in English, but won't work for Polish as I explained. It won't work for  French either, because French does not use an 's' if `nb` is 0. Instead we can do this:

    printf(ngettext("%d file\n", "%d files\n", nb), nb);

The `ngettext()` function takes `nb` into account to return the correct string. Then `printf()` can format the string, replacing the %d with the value of `nb`. If we generate a .pot file from such code, we get this:

    msgid "%d file\n"
    msgid_plural "%d files\n"
    msgstr[0] ""
    msgstr[1] ""

And if we create a Polish .po file for it, we get this:

    msgid "%d file\n"
    msgid_plural "%d files\n"
    msgstr[0] ""
    msgstr[1] ""
    msgstr[2] ""

One just have to provide the proper plural forms. Tools like Poedit are aware of these and adapt their user interface for plural forms, depending on the language.

## Using Gettext in Java

As I said before, `msgfmt` turns .po files into binary .mo files, which can be used from C code. `msgfmt` also provides a Java mode when called with the `--java2` option. In this mode it generates a temporary .java file, compiles it with the default `javac` and outputs the resulting .class file. The class in this file inherits from ResourceBundle, so if you don't care about plurals, you can use it like a plain ResourceBundle, except constants are replaced with real English strings.

gettext provides `libintl.jar` for proper plural support. This .jar provides an API similar to gettext C API. It basically exposes the JAVA equivalent of `gettext()` and `ngettext()` (see <https://www.gnu.org/savannah-checkouts/gnu/gettext/manual/javadoc2/>).

## What About Android?

This sounds simple enough, but then comes Android-specific problems.

My first problem was the .class file created by `msgfmt`. It won't load because it uses the JVM bytecode, not Android Dalvik .dex files. I made a patch for the tool to let it save the .java file instead, it [has been applied recently][patch], but is not yet available in the current release version.

[patch]: http://git.savannah.gnu.org/cgit/gettext.git/commit/?h=maint&id=75638a4cd22832f58d368e0316dc1c0a4598bbbf

Then comes a trickier problem: gettext is released under the LGPL 2.1 or later license, Burger Party is a proprietary game. The LGPL allows one to dynamically link a LGPL library to a proprietary program. It forbids static linking to ensure the user is able to replace the LGPL code with another version. Using a .jar in a .apk is not static linking, but it's not really dynamic linking either: the .jar is turned into a .dex and packed inside the .apk. I believe the spirit of the LGPL license would allow it to be used in Android .apk files but it's a gray area.

Searching the Internet for this topic brings many discussions pondering whether it is legal or not, where everybody says "but I am not a lawyer". Since I wanted a more authoritative answer, I reached out to the gettext maintainers, who pointed me to the FSF. Following the instructions from [their licensing page][licensing], I sent them an email.

Alas, questions asked by proprietary software developers are answered by paid support. They want $150 to answer my question. I understand they do not want to provide law advice for free to proprietary companies, but I find it quite sad that such a generic question does not get answered. $150 is not much, but I am not even sure I am going to make that much money with Burger Party, so I'd rather avoid it for now.

[licensing]: http://www.fsf.org/licensing/

## Finally, Introducing Linguaj

I already had a wrapper around gettext to provide a nicer API, so I decided to extend it to be able to use .po files. After all, the licensing problem is only with `libintl.jar`, not with the other gettext tools.  Thus came [Linguaj][], an Apache 2.0 licensed Java API as well as tools to use .po files in your Java application or Android game.

[Linguaj]: http://github.com/agateau/linguaj

The API is similar to gettext, yet a bit more convenient. Using it looks like this:

    import static com.greenyetilab.linguaj.Translator.tr;
    ...
    System.out.println(tr("Hello %s", name));

As you can see, it provides a static `tr()` method and supports message formatting so you don't have to wrap the resulting string in a call to `String.format()`.

It also supports plural as well:

    import static com.greenyetilab.linguaj.Translator.trn;
    ...
    System.out.println(trn("%# file", "%# files", nb));

Here we use `trn()` instead of `tr()` to get plural support. The third argument is the number we need to take into account to decide which plural form to return, and the special `%#` placeholder gets replaced with the value of this number. This is more convenient than `ngettext()` which requires you to pass the number twice: one time to `ngettext()`, another time to the string formatting code (as can be seen in the `ngettext()` example above).

You can use the `xgettext` tool to extract the strings. The invocation I use is:

    xgettext --from-code=utf-8 --keyword=tr --keyword=trn:1,2 -o po/messages.pot *.java

What's important here is the use of `--keyword=tr` and `--keyword=trn:1,2` to tell `xgettext` which method names to look for.

Once you have your .po file, you must use `po-compile` to create a .java file usable by Linguaj. This Python-based tool is available in the `scripts` directory of the repository.

Then, just include the file in your project, together with Linguaj Java code (either generate a .jar using the Ant script or simply copy the two Java files) and you should be good to go.

One final note: Linguaj initializes itself when `Translator.tr()` or `Translator.trn()` is called for the first time, but you can call `Translator.init()` explicitly. This is handy if you want to force the use of a different language. You can call this method several times, making it possible to change languages while your code is running (useful for games). The example provided in the repository demonstrates this.

That's it, I hope you find Linguaj useful for your translation needs. You can get it from its [GitHub][Linguaj] page.
