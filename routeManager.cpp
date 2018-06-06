#include "routeManager.h"
#include <QDebug>

RouteManager::RouteManager(QObject *parent) : QObject(parent), m_route1(nullptr), m_route2(nullptr)
{

}

QGeoPath *RouteManager::route1() const
{
	return m_route1;
}

QGeoPath *RouteManager::route2() const
{
	return m_route2;
}

void RouteManager::setRoute1(QGeoPath *route1)
{
	if (m_route1 == route1)
		return;

	delete m_route1;
	m_route1 = new QGeoPath(*route1);
	qDebug() << m_route1;
//	m_route1->setBounds(route1->bounds());
//	m_route1->setDistance(route1->distance());
//	m_route1->setFirstRouteSegment(route1->firstRouteSegment());
//	m_route1->setPath(route1->path());
//	m_route1->setRequest(route1->request());

	emit route1Changed(m_route1);
}

void RouteManager::setRoute2(QGeoPath *route2)
{
	if (m_route2 == route2)
		return;

	delete m_route2;
//	m_route2 = new QGeoPath(*route2);
	qDebug() << m_route2;
	emit route2Changed(m_route2);
}

bool RouteManager::intersect()
{
	qDebug() << m_route1 << m_route2;
}
