import '../../coordinate_system_files.dart';

class Distance extends Unit {
  late double value;
  DistanceTypes _type = DistanceTypes.m;

  Distance to(DistanceTypes type_) {
    double? current = ConstantValues.Meter2TypeConvertTable[_type];
    double? dest = ConstantValues.Meter2TypeConvertTable[type_];
    return Distance.withType(value * current! * dest!, type_);
  }

  Distance(double value) {
    Distance.withType(value, DistanceTypes.m);
  }

  Distance.zero() {
    Distance(0.0);
  }

  Distance.withType(double value_, DistanceTypes type) {
    value = value_;
    _type = type;
  }

  DistanceTypes get type => _type;

  set type(DistanceTypes type) {
    value = to(type).value;
    _type = type;
  }

  Distance operator +(Distance other) {
    return Distance.withType(value + other.to(_type).value, _type);
  }

  Distance operator -(Distance other) {
    return Distance.withType(value - other.to(_type).value, _type);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Distance &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          _type == other._type;

  @override
  int get hashCode => value.hashCode ^ _type.hashCode;
}

enum DistanceTypes { cm, m, km, mile, foot, yard, inch }
