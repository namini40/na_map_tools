import 'distance.dart';

extension DistanceEx on double {
  Distance toDistance() => Distance(this);
}
