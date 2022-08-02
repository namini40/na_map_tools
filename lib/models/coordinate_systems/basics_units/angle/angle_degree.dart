import 'dart:math';

import 'package:na_map_tools/models/constants.dart';

import '../../coordinate_system_files.dart';

class AngleDegree extends Angle {
  double value = 0.0;
  static const maxValue = 360.0;

  AngleDegree(double degree) {
    value = degree;
  }

  factory AngleDegree.zero() {
    return AngleDegree(0.0);
  }

  factory AngleDegree.from(Angle angle) {
    return angle.toDegree();
  }

  AngleDMS _toDMS() {
    var dms = AngleDMS.zero();
    dms.degree = value.floor();
    double part = (value - dms.degree) * 60.0;
    dms.minute = part.floor();
    part = (value - dms.degree - dms.minute / 60.0) * 3600.0;
    dms.second = part;
    return dms;
  }

  AngleDegree _fromDMS(AngleDMS dms) {
    return dms.toDegree();
  }

  AngleRadian _toRadian() {
    return AngleRadian(value * pi / 180.0);
  }

  AngleDegree _fromRadian(AngleRadian radian) {
    return AngleDegree(radian.value * 180.0 / pi);
  }

  @override
  AngleDMS toDMS() {
    return _toDMS();
  }

  @override
  AngleDegree toDegree() {
    return this;
  }

  @override
  AngleRadian toRadian() {
    return _toRadian();
  }

  @override
  AngleDegree operator +(Angle other) {
    final angleMain = this;
    final angleOther = other.toDegree();
    double sum = angleOther.value + angleMain.value;
    if (sum > maxValue) {
      sum %= maxValue;
    }
    return AngleDegree(sum);
  }

  @override
  AngleDegree operator -(Angle other) {
    final angleOther = other.toDegree();
    double sub = value - angleOther.value;
    if (sub > maxValue) {
      sub %= maxValue;
    }
    while (sub < 0) {
      sub += maxValue;
    }
    return AngleDegree(sub);
  }

  @override
  String toString() {
    return 'AngleDegree{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AngleDegree &&
          runtimeType == other.runtimeType &&
          (value - other.value) < pow(10, -anglePrecisionComparison);

  @override
  int get hashCode => value.hashCode;
}
