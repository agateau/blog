#include "mainwindow.h"

#include <QtDeclarative/QDeclarativeContext>
#include <QtDeclarative/QDeclarativeProperty>
#include <QtGui/QGraphicsObject>
#include <QtGui/QGridLayout>

MainWindow::MainWindow(QWidget *parent)
: QWidget(parent)
, m_view(new QDeclarativeView)
, m_xSpinBox(new QSpinBox)
, m_ySpinBox(new QSpinBox)
, m_radiusSlider(new QSlider(Qt::Horizontal))
, m_updatingSpinBoxes(false)
{
    // QML
    QUrl url("qrc:///qml/main.qml");
    m_view->setSource(url);
    m_root = m_view->rootObject();

    // Widgets
    m_radiusSlider->setValue(40);
    m_xSpinBox->setRange(-10000, 10000);
    m_ySpinBox->setRange(-10000, 10000);

    // Layout
    QGridLayout* layout = new QGridLayout(this);
    layout->addWidget(m_view, 0, 0, 1, 3);
    layout->addWidget(m_xSpinBox, 1, 0);
    layout->addWidget(m_ySpinBox, 1, 1);
    layout->addWidget(m_radiusSlider, 1, 2);

    // ball => spinboxes
    QDeclarativeProperty xProp(m_root, "ballX");
    xProp.connectNotifySignal(this, SLOT(updateSpinBoxes()));
    QDeclarativeProperty yProp(m_root, "ballY");
    yProp.connectNotifySignal(this, SLOT(updateSpinBoxes()));

    // spinboxes => ball
    connect(m_xSpinBox, SIGNAL(valueChanged(int)), SLOT(updateBall()));
    connect(m_ySpinBox, SIGNAL(valueChanged(int)), SLOT(updateBall()));

    // Radius property
    connect(m_radiusSlider, SIGNAL(valueChanged(int)), SIGNAL(radiusChanged(int)));

    // Expose ourself
    m_view->rootContext()->setContextProperty("mainWindow", this);

    updateSpinBoxes();
}

void MainWindow::updateSpinBoxes()
{
    m_updatingSpinBoxes = true;
    m_xSpinBox->setValue(m_root->property("ballX").toInt());
    m_ySpinBox->setValue(m_root->property("ballY").toInt());
    m_updatingSpinBoxes = false;
}

void MainWindow::updateBall()
{
    if (m_updatingSpinBoxes) {
        return;
    }
    m_root->setProperty("ballX", m_xSpinBox->value());
    m_root->setProperty("ballY", m_ySpinBox->value());
}

int MainWindow::radius() const
{
    return m_radiusSlider->value();
}

void MainWindow::setRadius(int value)
{
    m_radiusSlider->setValue(value);
}
