// FIvanO
#include <QGeoCoordinate>

class LineSegment
{
    public:
        LineSegment();
		LineSegment(const QGeoCoordinate &a, const QGeoCoordinate &b);
		static bool isCross(const LineSegment &a, const LineSegment &b);
		QGeoCoordinate a() const;
		void setA(const QGeoCoordinate &a);

		QGeoCoordinate b() const;
		void setB(const QGeoCoordinate &b);

private:
		QGeoCoordinate m_a;
		QGeoCoordinate m_b;
};
