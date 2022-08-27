/// this is the base class for angular values
/// for now its just based on degrees however it must be capable of radian and DMS and others
class Angle {
  double _value;

  // basic constructor
  Angle(double value) : _value = value;

  double get value => _value;

  // result always is some value between 0 to 360 degrees
  Angle operator +(Angle other) {
    return Angle((_value + other.value) % 360.0);
  }

  Angle operator -(Angle other) {
    return Angle((_value - other.value) % 360.0);
  }
}
