import '../../coordinate_system_files.dart';

class AngleDMS extends Angle {
  late int degree;
  late int minute;
  late double second;

  AngleDMS(int deg, int min, double sec) {
    degree = deg;
    minute = min;
    second = sec;
  }

  AngleDMS.zero() {
    AngleDMS(0, 0, 0.0);
  }

  AngleDMS.from(Angle angle) {
    angle.toDMS();
  }

  @override
  AngleDMS toDMS() {
    return this;
  }

  @override
  AngleDegree toDegree() {
    return _toDegree();
  }

  @override
  AngleRadian toRadian() {
    return _toRadian();
  }

  AngleDegree _toDegree() {
    return AngleDegree(degree + minute / 60.0 + second / 3600.0);
  }

  AngleRadian _toRadian() {
    return _toDegree().toRadian();
  }
}
