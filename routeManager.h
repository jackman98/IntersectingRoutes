#ifndef UTILITES_H
#define UTILITES_H

#include <QObject>
#include <QGeoPath>

class RouteManager : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QGeoPath* route1 READ route1 WRITE setRoute1 NOTIFY route1Changed)
	Q_PROPERTY(QGeoPath* route2 READ route2 WRITE setRoute2 NOTIFY route2Changed)

	QGeoPath* m_route1;
	QGeoPath* m_route2;

public:
	explicit RouteManager(QObject *parent = nullptr);

	QGeoPath *route1() const;
	QGeoPath *route2() const;

signals:

	void route1Changed(QGeoPath* route1);
	void route2Changed(QGeoPath* route2);

public slots:
	void setRoute1(QGeoPath *route1);
	void setRoute2(QGeoPath *route2);
	bool intersect();
};

#endif // UTILITES_H
