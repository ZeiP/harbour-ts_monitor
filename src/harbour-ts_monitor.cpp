#include <QtQuick>
#include <sailfishapp.h>
#include "ts3.h"

int main(int argc, char *argv[])
{
    // Set up QML engine.
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> v(SailfishApp::createView());

    // If you wish to publish your app on the Jolla harbour, it is recommended
    // that you prefix your internal namespaces with "harbour.".
    //
    // For details see:
    // https://harbour.jolla.com/faq#1.5.0
    qmlRegisterType<TS3>("harbour.ts_monitor", 1, 0, "TS3");

    TS3 *ts3 = new TS3();
    v->rootContext()->setContextProperty("ts3", ts3);

    // Start the application.
    v->setSource(SailfishApp::pathTo("qml/harbour-ts_monitor.qml"));
    v->show();
    return app->exec();
}
