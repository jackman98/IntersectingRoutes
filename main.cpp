#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "routeManager.h"
#include <QDebug>

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	qmlRegisterType<RouteManager>("Utilites", 1, 0, "RouteManager");
	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
	qDebug() << engine.rootObjects().at(0)->objectName();
	if (engine.rootObjects().isEmpty())
		return -1;

	return app.exec();
}
