import 'dart:math';

import '../../coordinate_system_files.dart';

class AngleDegree extends Angle {
  late double value;
  static const maxValue = 360.0;

  AngleDegree(double degree) {
    value = degree;
  }

  AngleDegree.zero() {
    AngleDegree(0.0);
  }

  AngleDegree.from(Angle angle) {
    angle.toDegree();
  }

  AngleDMS _toDMS() {
    var dms = AngleDMS.zero();
    dms.degree = value.floor();
    double part = (value - dms.degree) / 60.0;
    dms.minute = part.floor();
    part = (value - dms.degree - dms.minute * 60.0) / 60.0;
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
  Angle operator +(Angle other) {
    final angleMain = this;
    final angleOther = other.toDegree();
    angleMain.value = angleOther.value + angleMain.value;
    if (angleMain.value > maxValue) {
      angleMain.value %= maxValue;
    }
    return angleMain;
  }

  @override
  Angle operator -(Angle other) {
    final angleMain = this;
    final angleOther = other.toDegree();
    angleMain.value = angleOther.value - angleMain.value;
    if (angleMain.value > maxValue) {
      angleMain.value %= maxValue;
    }
    while (angleMain.value < 0) {
      angleMain.value += maxValue;
    }
    return angleMain;
  }
}
