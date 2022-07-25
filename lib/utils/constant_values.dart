import '../namaptools_lib.dart';

class ConstantValues {
  static final Map<DistanceTypes, double> Meter2TypeConvertTable = {
    DistanceTypes.cm: 100,
    DistanceTypes.m: 1,
    DistanceTypes.km: 0.001,
    DistanceTypes.mile: 0.000621371,
    DistanceTypes.foot: 3.28084,
    DistanceTypes.yard: 1.09361,
    DistanceTypes.inch: 39.3701
  };
}
