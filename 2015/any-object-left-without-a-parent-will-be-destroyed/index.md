pub_date: 2015-09-15 19:02:23 +02:00
﻿pub_date: 2015-05-28 22:18:25 +02:00
public: true
tags: [qt, qml]
title: "Any Object Left Without a Parent Will Be Destroyed"
summary: |
    Story of a tricky bug with QML I encountered at work.

Recently we had to fix a tricky crash at work: our Qt Quick app was crashing randomly when switching between two pages of the app.

The backtrace looked as if a QObject::deleteLater was trying to delete an already deleted object. Running the app with Valgrind confirmed we were trying to delete an already deleted pointer.

After much debugging, we found out the reason for the crash. Our app contains a C++ Qt model, which wraps a list of QObject. Some properties of the QObject are exposed as roles in the model, but we also have a getter which returns the QObject itself.

Here is a rough summary of the code.

The object used for the rows of the model:

```
class MyObject: public QObject {
    Q_OBJECT
public:
    MyObject(int value, QObject* parent = 0);
    Q_INVOKABLE doSomething();
};
```

The model looks like this:

```
class MyModel : public QAbstractListModel {
    Q_OBJECT
public:
    MyModel(QObject* parent = 0)
    : QAbstractListModel(parent) {
        mObjects
            << new MyObject(12)
            << new MyObject(34);
    }
    ~MyModel() {
        qDeleteAll(mObjects);
    }
    Q_INVOKABLE MyObject* objectAt(int row) const {
        return mObjects[row];
    }
private:
    QList<MyObject*> mObjects;
};
```

The QML code uses the model like this:

```
ListView {
    model: MyModel {
        id: myModel
    }
    delegate: Row {
        Text {
            text: model.value
        }
        Button {
            text: "Do something"
            onClicked: {
                var myObject = myModel.objectAt(model.index);
                myObject.doSomething();
            }
        }
    }
```

Can you spot the bug?

Here is what's wrong: when QML gets a MyObject instance through the objectAt() method, it receives a QObject, but this QObject has no parent (since MyModel constructor creates the  MyObject instances without setting a parent). What does QML do if it gets a parent-less QObject? The answer is in [QQmlEngine::ObjectOwnership doc][qtdoc]: it takes ownership of it... and will garbage collect it when it feels like doing some clean up. If QML garbage collector runs before MyModel destructor, the destructor will crash in the qDeleteAll() call...

[qtdoc]: http://doc.qt.io/qt-5/qqmlengine.html#ObjectOwnership-enum

We fixed it by making the MyObject instances children of the model. Since the objects now have a parent, QML does not take ownership of them anymore. We assumed it was not necessary because we were taking care of deleting all instances with the qDeleteAll() in the destructor, but in this case, that turned out to be an error. Another possible approach (which we did not try) would have been to explicitly set the ownership using [QQmlEngine::setOwnership()][setownership].

[setownership]: http://doc.qt.io/qt-5/qqmlengine.html#setObjectOwnership

So remember, do not leave any QObject <strike>unattended</strike> without a parent, otherwise the QML engine will destroy it!
