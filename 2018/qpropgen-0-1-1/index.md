pub_date: 2018-12-09 11:22:19 +01:00
public: true
tags: [qpropgen, release-month, qt, qml, pko]
title: Release month, qpropgen 0.1.1

Continuing on this release month idea started [last week][], here is a release
of another project. Today is the first release of [qpropgen][], a tool to generate
QML-friendly QObject-based C++ classes from class definition files.

[last week]: ../doxyqml-0-5-0

<!-- break -->

I started this project because I did not want to manually define the dozen of
properties required to represent a sound in [SFXR-Qt][], which itself got
started because I wanted a sound effect generator for [Pixel Wheels][pw].
Yes, that's a bit of Yak shaving :)

[SFXR-Qt]: https://github.com/agateau/sfxr-qt
[pw]: /projects/pixelwheels

It works this way: first you define your class and its properties in a yaml file:

```yaml
class: Person
properties:
    - name: firstName
      type: QString
    - name: lastName
      type: QString
    - name: birthDate
      type: QDateTime
```

Then you run `qpropgen person.yaml`. It produces two files: `person.h` and `person.cpp`.

This is `person.h`:

```c++
// This file has been generated with qpropgen, any changes made to it will be lost!
#ifndef PERSON_H
#define PERSON_H
#include <QObject>
class Person : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString firstName READ firstName
            WRITE setFirstName
            NOTIFY firstNameChanged
    )
    Q_PROPERTY(QString lastName READ lastName
            WRITE setLastName
            NOTIFY lastNameChanged
    )
    Q_PROPERTY(QDateTime birthDate READ birthDate
            WRITE setBirthDate
            NOTIFY birthDateChanged
    )
public:
    explicit Person(QObject* parent = nullptr);
     QString firstName() const;
     void setFirstName(const QString& value);
     QString lastName() const;
     void setLastName(const QString& value);
     QDateTime birthDate() const;
     void setBirthDate(const QDateTime& value);
signals:
    void firstNameChanged(const QString& firstName);
    void lastNameChanged(const QString& lastName);
    void birthDateChanged(const QDateTime& birthDate);
private:
    QString mFirstName;
    QString mLastName;
    QDateTime mBirthDate;
};
#endif // PERSON_H
```

And this is `person.cpp`:

```c++
// This file has been generated with qpropgen, any changes made to it will be lost!
#include <person.h>
Person::Person(QObject* parent)
    : QObject(parent) {
}
QString Person::firstName() const {
    return mFirstName;
}
void Person::setFirstName(const QString& value) {
    if (mFirstName == value) {
        return;
    }
    mFirstName = value;
    firstNameChanged(value);
}
QString Person::lastName() const {
    return mLastName;
}
void Person::setLastName(const QString& value) {
    if (mLastName == value) {
        return;
    }
    mLastName = value;
    lastNameChanged(value);
}
QDateTime Person::birthDate() const {
    return mBirthDate;
}
void Person::setBirthDate(const QDateTime& value) {
    if (mBirthDate == value) {
        return;
    }
    mBirthDate = value;
    birthDateChanged(value);
}
```

qpropgen comes with a CMake file to include in your project. Contributions adding support for other build systems are greatly appreciated :)

There is more to it: you can define read-only properties, make setters and getters virtual and a few other tweaks. You can learn more about qpropgen from the [README][qpropgen].

Let me know if you find this tool useful!

[qpropgen]: https://github.com/agateau/qpropgen
