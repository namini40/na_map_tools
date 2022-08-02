import '../../../constants.dart';
import '../../coordinate_system_files.dart';

class AngleDMS extends Angle {
  int degree = 0;
  int minute = 0;
  double second = 0;

  AngleDMS(int deg, int min, double sec) {
    degree = deg;
    minute = min;
    second = sec;
  }

  factory AngleDMS.zero() {
    return AngleDMS(0, 0, 0.0);
  }

  factory AngleDMS.from(Angle angle) {
    return angle.toDMS();
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

  @override
  Angle operator +(Angle other) {
    final degSum = toDegree() + other.toDegree();
    return degSum.toDMS();
  }

  @override
  Angle operator -(Angle other) {
    final degMinus = toDegree() - other.toDegree();
    return degMinus.toDMS();
  }

  @override
  String toString() {
    return 'AngleDMS{degree: $degree, minute: $minute, second: $second}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AngleDMS &&
          runtimeType == other.runtimeType &&
          degree == other.degree &&
          minute == other.minute &&
          second.toStringAsFixed(anglePrecisionComparisonForDMSSeconds) ==
              other.second
                  .toStringAsFixed(anglePrecisionComparisonForDMSSeconds);

  @override
  int get hashCode => degree.hashCode ^ minute.hashCode ^ second.hashCode;
}
