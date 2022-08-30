/// this is the base class for angular values
/// for now its just based on degrees however it must be capable of radian and DMS and others
class Angle {
  late double _value;

  // basic constructor
  Angle(double value) : _value = value;

  // building object from Degree, minutes and seconds
  Angle.fromDMS({int degree = 0, int minutes = 0, double seconds = 0.0})
      : assert(minutes <= 60 && seconds <= 60) {
    _value = _dms2deg(degree, minutes, seconds);
  }

  double get value => _value;

  // result always is some value between 0 to 360 degrees
  Angle operator +(Angle other) {
    return Angle((_value + other.value) % 360.0);
  }

  Angle operator -(Angle other) {
    return Angle((_value - other.value) % 360.0);
  }

  double _dms2deg(int degree, int minutes, double seconds) {
    return degree + minutes / 60 + seconds / 3600;
  }
}
