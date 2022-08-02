import 'dart:math';

import '../../coordinate_system_files.dart';

class AngleRadian extends Angle {
  double value = 0.0;

  AngleRadian(double radian) {
    value = radian;
  }

  factory AngleRadian.zero() {
    return AngleRadian(0.0);
  }

  AngleRadian.from(Angle angle) {
    angle.toRadian();
  }

  @override
  AngleDMS toDMS() {
    return _toDMS();
  }

  @override
  AngleDegree toDegree() {
    return _toDegree();
  }

  @override
  AngleRadian toRadian() {
    return this;
  }

  AngleDMS _toDMS() {
    var dms = _toDegree().toDMS();
    return AngleDMS.from(dms);
  }

  AngleDegree _toDegree() {
    var degree = value * 180.0 / pi;
    return AngleDegree(degree);
  }

  @override
  Angle operator +(Angle other) {
    final degSum = toDegree() + other.toDegree();
    return degSum.toRadian();
  }

  @override
  Angle operator -(Angle other) {
    final degMinus = toDegree() - other.toDegree();
    return degMinus.toRadian();
  }

  @override
  String toString() {
    return 'AngleRadian{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AngleRadian &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
