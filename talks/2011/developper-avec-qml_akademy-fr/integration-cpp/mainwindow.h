#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtGui/QSlider>
#include <QtGui/QSpinBox>
#include <QtGui/QWidget>
#include <QtDeclarative/QDeclarativeView>

class MainWindow : public QWidget
{
    Q_OBJECT

    Q_PROPERTY(int radius READ radius WRITE setRadius NOTIFY radiusChanged)

public:
    MainWindow(QWidget *parent = 0);

    int radius() const;
    Q_INVOKABLE void setRadius(int);

Q_SIGNALS:
    void radiusChanged(int);

private Q_SLOTS:
    void updateSpinBoxes();
    void updateBall();

private:
    QDeclarativeView* m_view;
    QSpinBox* m_xSpinBox;
    QSpinBox* m_ySpinBox;
    QSlider* m_radiusSlider;
    QObject* m_root;

    bool m_updatingSpinBoxes;
};

#endif // MAINWINDOW_H
