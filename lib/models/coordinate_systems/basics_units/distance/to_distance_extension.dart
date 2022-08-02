import 'package:na_map_tools/models/coordinate_systems/coordinate_system_files.dart';

extension DistanceEx on double {
  Distance toDistance() => Distance(this);
}
