#ifndef UTILITES_H
#define UTILITES_H

#include <QObject>
#include <QGeoRoute>

class RouteManager : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QObject* route1 READ route1 WRITE setRoute1 NOTIFY route1Changed)
	Q_PROPERTY(QObject* route2 READ route2 WRITE setRoute2 NOTIFY route2Changed)

	QObject* m_qmlRoute1;
	QObject* m_qmlRoute2;
	QList<QGeoCoordinate> *m_pathRoute1;
	QList<QGeoCoordinate> *m_pathRoute2;

	QList<QGeoCoordinate> *getPath(QObject *object);

public:
	explicit RouteManager(QObject *parent = nullptr);

	QObject* route1() const;
	QObject* route2() const;

signals:
	void route1Changed(QObject* route1);
	void route2Changed(QObject* route2);

public slots:
	bool intersect();
	void setRoute1(QObject* route1);
	void setRoute2(QObject* route2);
};

#endif // UTILITES_H
