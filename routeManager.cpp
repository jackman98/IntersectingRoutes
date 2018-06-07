#include "routeManager.h"
#include <QDebug>
#include <QQmlApplicationEngine>
#include <QList>
#include <QVariant>
#include <QVariantList>
#include "lineSegment.h"

RouteManager::RouteManager(QObject *parent) : QObject(parent), m_pathRoute1(nullptr), m_pathRoute2(nullptr)
{

}

QObject *RouteManager::route1() const
{
	return m_qmlRoute1;
}

QObject *RouteManager::route2() const
{
	return m_qmlRoute2;
}

void RouteManager::setRoute1(QObject *route1)
{
	if (m_qmlRoute1 == route1)
		return;

	m_qmlRoute1 = route1;

	delete m_pathRoute1;
	m_pathRoute1 = getPath(m_qmlRoute1);
	emit route1Changed(m_qmlRoute1);
}

void RouteManager::setRoute2(QObject *route2)
{
	if (m_qmlRoute2 == route2)
		return;

	m_qmlRoute2 = route2;
	delete m_pathRoute2;
	m_pathRoute2 = getPath(m_qmlRoute2);
	emit route2Changed(m_qmlRoute2);
}

QList<QGeoCoordinate> *RouteManager::getPath(QObject *object)
{
	QList<QGeoCoordinate> *coords = new QList<QGeoCoordinate>();
	QVariantList list = qvariant_cast<QVariantList>(object->property("path"));
	for (auto &v : list) {
		coords->append(qvariant_cast<QGeoCoordinate>(v));
	}
	qDebug() << coords;
	return coords;
}

bool RouteManager::intersect()
{

	m_pathRoute1 = getPath(m_qmlRoute1);
	m_pathRoute2 = getPath(m_qmlRoute2);

	QList<LineSegment> segments1;
	for (int i = 0; i < m_pathRoute1->size() - 1; ++i) {
		segments1.append(LineSegment(m_pathRoute1->at(i), m_pathRoute1->at(i + 1)));
	}

	QList<LineSegment> segments2;
	for (int i = 0; i < m_pathRoute2->size() - 1; ++i) {
		segments2.append(LineSegment(m_pathRoute2->at(i), m_pathRoute2->at(i + 1)));
	}

	for (int i = 0; i < segments1.size(); ++i) {
		for (int j = 0; j < segments2.size(); ++j) {
			if (LineSegment::isCross(segments1.at(i), segments2.at(j))) {
				return true;
			}
		}
	}
	return false;
}
