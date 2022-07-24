import '../../coordinate_system_files.dart';

class Distance extends Unit {
  late double _value;
  DistanceTypes _type = DistanceTypes.m;

  double to(DistanceTypes type) {
    double? current = ConstantValues.Meter2TypeConvertTable[_type];
    double? dest = ConstantValues.Meter2TypeConvertTable[type];
    value = value * current! * dest!;
    return value;
  }

  Distance(double value) {
    Distance.withType(value, DistanceTypes.m);
  }
  Distance.withType(double value, DistanceTypes type) {
    _value = value;
    _type = type;
  }

  DistanceTypes get type => _type;

  set type(DistanceTypes type) {
    value = to(type);
    _type = type;
  }

  double get value => _value;

  set value(double value) {
    _value = value;
  }
}

enum DistanceTypes { cm, m, km, mile, foot, yard, inch }
