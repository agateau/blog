pub_date: 2017-03-05 23:41:57 +01:00
public: true
tags: [qt, threads, tip, synesthesia, debug, pko]
title: Visualizing threads in QDebug output
summary: |
    How to combine a terminal colorizer and QDebug to visualize thread activity in your Qt application.

Here is a handy tip I figured out recently to track in which thread things happens inside a Qt application. First install [Synesthesia][]. This command line tool let's you highlight the output of your program based on regular expressions. The beauty of Synesthesia is that it automatically picks the color of the highlight, and it does so based on the *matched string*, not the matched expression (this distinction is important).

Here is an example. Let's create a file with the following content:

    Hello world
    Some other line
    Goodbye world

If we pipe this through `synesthesia '.*world'` we get this:

<p style="background-color: black; color: white"><font face="monospace">
<font color="#18b218">$ </font>synesthesia '.*world' &lt; example.txt<br/>
<font color="#87ffd7">Hello world</font><br/>
Some other line<br/>
<font color="#ffd787">Goodbye world</font><br/>
</p>

As you can see, it picked different colors for the "hello world" and "goodbye world" sentences because even if they match the same regular expression, the matched string is different.

How can we use this to inspect thread activity in our program? Here is a simple Qt multithreaded program. It prints numbers from 0 to 9 in two threads, with a random wait between each number.

.. sourcecode:: c++

    #include <QCoreApplication>
    #include <QDebug>
    #include <QThread>

    class CounterThread : public QThread
    {
    protected:
        void run() {
            // Hackish way to set a different random seed per thread
            qsrand(reinterpret_cast<qint64>(this));

            for (int x = 0; x < 10; ++x) {
                qDebug() << x;
                int delay = qrand() % 500;
                QThread::msleep(delay);
            }
            qDebug() << "done";
        }
    };

    int main(int, char**)
    {
        CounterThread thread1;
        CounterThread thread2;

        thread1.start();
        thread2.start();
        qDebug() << "wait";
        thread1.wait();
        qDebug() << "thread1 finished";
        thread2.wait();
        qDebug() << "thread2 finished";
        return 0;
    }

Let's run this example:

<p style="background-color: black; color: white"><font face="monospace">
<font color="#18b218">$ </font>./threadedapp
wait<br/>
0<br/>
0<br/>
1<br/>
2<br/>
1<br/>
2<br/>
3<br/>
4<br/>
3<br/>
5<br/>
4<br/>
5<br/>
6<br/>
6<br/>
7<br/>
8<br/>
7<br/>
9<br/>
8<br/>
9<br/>
done<br/>
done<br/>
thread1 finished<br/>
thread2 finished<br/>
</p>

Now, let's take advantage of the [customizability of QDebug][pattern] to print the thread id (and the message type while we are at it). We can do so by setting the `QT_MESSAGE_PATTERN` environment variable:

<p style="background-color: black; color: white"><font face="monospace">
<font color="#18b218">$ </font>QT_MESSAGE_PATTERN='%{threadid} %{type} %{message}' ./threadedapp<br/>
24914 debug wait<br/>
24916 debug 0<br/>
24915 debug 0<br/>
24916 debug 1<br/>
24915 debug 1<br/>
24916 debug 2<br/>
24915 debug 2<br/>
24916 debug 3<br/>
24916 debug 4<br/>
24915 debug 3<br/>
24916 debug 5<br/>
24915 debug 4<br/>
24915 debug 5<br/>
24915 debug 6<br/>
24916 debug 6<br/>
24916 debug 7<br/>
24916 debug 8<br/>
24915 debug 7<br/>
24916 debug 9<br/>
24915 debug 8<br/>
24915 debug 9<br/>
24916 debug done<br/>
24915 debug done<br/>
24914 debug thread1 finished<br/>
24914 debug thread2 finished<br/>
</p>

[pattern]: http://doc.qt.io/qt-5/qtglobal.html#qSetMessagePattern

That's already interesting: we can see which thread prints what. But let's pipe the output to Synesthesia with a regular expression matching the thread ids of our program:

<p style="background-color: black; color: white"><font face="monospace">
<font color="#18b218">$ </font>QT_MESSAGE_PATTERN='%{threadid} %{type} %{message}' ./threadedapp 2&gt;&amp;1 | synesthesia '^[0-9]+' <br/>
<font color="#87ffd7">24429</font> debug 0 <br/>
<font color="#ffd787">24428</font> debug 0 <br/>
<font color="#ffafd7">24426</font> debug wait <br/>
<font color="#ffd787">24428</font> debug 1 <br/>
<font color="#87ffd7">24429</font> debug 1 <br/>
<font color="#87ffd7">24429</font> debug 2 <br/>
<font color="#87ffd7">24429</font> debug 3 <br/>
<font color="#ffd787">24428</font> debug 2 <br/>
<font color="#87ffd7">24429</font> debug 4 <br/>
<font color="#ffd787">24428</font> debug 3 <br/>
<font color="#ffd787">24428</font> debug 4 <br/>
<font color="#87ffd7">24429</font> debug 5 <br/>
<font color="#87ffd7">24429</font> debug 6 <br/>
<font color="#ffd787">24428</font> debug 5 <br/>
<font color="#ffd787">24428</font> debug 6 <br/>
<font color="#ffd787">24428</font> debug 7 <br/>
<font color="#ffd787">24428</font> debug 8 <br/>
<font color="#ffd787">24428</font> debug 9 <br/>
<font color="#87ffd7">24429</font> debug 7 <br/>
<font color="#ffd787">24428</font> debug done <br/>
<font color="#ffafd7">24426</font> debug thread1 finished <br/>
<font color="#87ffd7">24429</font> debug 8 <br/>
<font color="#87ffd7">24429</font> debug 9 <br/>
<font color="#87ffd7">24429</font> debug done <br/>
<font color="#ffafd7">24426</font> debug thread2 finished<br/>
</p>

The color makes it much easier to figure out what's going on, and thanks to QDebug runtime customizability, we didn't even had to modify our code!

That's it for this article, give [Synesthesia][] a try, it's a really handy tool!

[Synesthesia]: https://github.com/cromo/synesthesia
