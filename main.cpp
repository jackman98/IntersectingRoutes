#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "routeManager.h"

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	qRegisterMetaType<QGeoPath*>("QGeoPath*");
	qmlRegisterType<RouteManager>("Utilites", 1, 0, "RouteManager");
	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty())
		return -1;

	return app.exec();
}
