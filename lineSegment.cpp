#include "lineSegment.h"

LineSegment:: LineSegment() {}

LineSegment:: LineSegment(const QGeoCoordinate &a, const QGeoCoordinate &b)
{
	m_a = a;
	m_b = b;
}

bool LineSegment:: isCross(const LineSegment &a, const LineSegment &b)
{
    double det1;
    double det2;
    double det3;
    double det4;
	det1 = (b.m_a.latitude() - a.m_a.latitude()) * (a.m_b.longitude() - a.m_a.longitude()) - (b.m_a.longitude() - a.m_a.longitude()) * (a.m_b.latitude() - a.m_a.latitude());
	det2 = (b.m_b.latitude() - a.m_a.latitude()) * (a.m_b.longitude() - a.m_a.longitude()) - (b.m_b.longitude() - a.m_a.longitude()) * (a.m_b.latitude() - a.m_a.latitude());
	det3 = (a.m_a.latitude() - b.m_a.latitude()) * (b.m_b.longitude() - b.m_a.longitude()) - (a.m_a.longitude() - b.m_a.longitude()) * (b.m_b.latitude() - b.m_a.latitude());
	det4 = (a.m_b.latitude() - b.m_a.latitude()) * (b.m_b.longitude() - b.m_a.longitude()) - (a.m_b.longitude() - b.m_a.longitude()) * (b.m_b.latitude() - b.m_a.latitude());

	if (det1 * det2 > 0) return false;
	if (det3 * det4 > 0) return false;
	if (det1 * det2 < 0 && det3 * det4 < 0) return true;
    if (det1 == 0 && det2 == 0 && det3 == 0 && det4 == 0)
		if (((a.m_a.longitude() > std:: min(b.m_a.longitude(), b.m_b.longitude()) &&
			  a.m_a.longitude() < std:: max(b.m_a.longitude(), b.m_b.longitude())) ||
			 (a.m_b.longitude() > std:: min(b.m_a.longitude(), b.m_b.longitude()) &&
			  a.m_b.longitude() < std:: max(b.m_a.longitude(), b.m_b.longitude()))) ||
			((b.m_a.longitude() > std:: min(a.m_a.longitude(), a.m_b.longitude()) &&
			  b.m_a.longitude() < std:: max(a.m_a.longitude(), a.m_b.longitude())) ||
			 (b.m_b.longitude() > std:: min(a.m_a.longitude(), a.m_b.longitude()) &&
			  b.m_b.longitude() < std:: max(a.m_a.longitude(), a.m_b.longitude()))) ) return true;

    if (det1 == 0 && det2 == 0 && det3 == 0 && det4 == 0)
		if (a.m_a.longitude() == a.m_b.longitude() && a.m_b.longitude() == b.m_a.longitude() && b.m_a.longitude() == b.m_b.longitude())
		if (((a.m_a.latitude() > std:: min(b.m_a.latitude(), b.m_b.latitude()) &&
			  a.m_a.latitude() < std:: max(b.m_a.latitude(), b.m_b.latitude())) ||
			 (a.m_b.latitude() > std:: min(b.m_a.latitude(), b.m_b.latitude()) &&
			  a.m_b.latitude() < std:: max(b.m_a.latitude(), b.m_b.latitude()))) ||
			((b.m_a.latitude() > std:: min(a.m_a.latitude(), a.m_b.latitude()) &&
			  b.m_a.latitude() < std:: max(a.m_a.latitude(), a.m_b.latitude())) ||
			 (b.m_b.latitude() > std:: min(a.m_a.latitude(), a.m_b.latitude()) &&
			  b.m_b.latitude() < std:: max(a.m_a.latitude(), a.m_b.latitude()))) ) return true;

	if (det1 == 0 || det2 == 0 || det3 == 0 || det4 == 0) return true;

	return false;
}

QGeoCoordinate LineSegment::a() const
{
	return m_a;
}

void LineSegment::setA(const QGeoCoordinate &a)
{
	m_a = a;
}

QGeoCoordinate LineSegment::b() const
{
	return m_b;
}

void LineSegment::setB(const QGeoCoordinate &b)
{
	m_b = b;
}
