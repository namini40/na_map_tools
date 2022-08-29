import 'package:na_map_tools/models/basics_units/distance/distance.dart';

import '../basics_units/angle/angle.dart';

extension on double {
  Angle toAngle() => Angle(this);
  Distance toDistance() => Distance(this);
}
