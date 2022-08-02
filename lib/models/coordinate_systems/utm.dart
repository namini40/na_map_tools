import 'dart:math';

import 'package:na_map_tools/models/coordinate_systems/basics_units/distance/to_distance_extension.dart';
import 'package:na_map_tools/models/coordinate_systems/coordinate_system_files.dart';

import 'basics_units/distance/distance.dart';
import 'coordinate_system.dart';

/// base class for Universal Transverse Mercator coordinate system
/// you can read more about it here: https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system
///
class UTM extends CoordinateSystem {
  late int zone;
  late Distance N;
  late Distance E;
  bool northernHemisphere;

  UTM(
      {required double N_,
      required double E_,
      required int zone_,
      this.northernHemisphere = false}) {
    N = Distance(N_);
    E = Distance(E_);
    zone = zone_;
  }

  @override
  CoordinateSystem toUTM() {
    // TODO: implement toUTM
    throw UnimplementedError();
  }

  /// this implemetation was based on: https://stackoverflow.com/questions/343865/how-to-convert-from-utm-to-latlng-in-python-or-javascript/344083#344083
  @override
  CoordinateSystem toWGS() => _toWGS();

  WGS _toWGS() {
    N = northernHemisphere ? N : 10000000.0.toDistance() - N;
    final a = 6378137.0.toDistance();
    double e = 0.081819191;
    double e1sq = 0.006739497;
    double k0 = 0.9996;

    final arc = N.value / k0;
    final mu = arc /
        (a.value *
            (1 -
                pow(e, 2) / 4.0 -
                3 * pow(e, 4) / 64.0 -
                5 * pow(e, 6) / 256.0));

    final ei =
        (1 - pow((1 - e * e), (1 / 2.0))) / (1 + pow((1 - e * e), (1 / 2.0)));

    final ca = 3 * ei / 2 - 27 * pow(ei, 3) / 32.0;

    final cb = 21 * pow(ei, 2) / 16 - 55 * pow(ei, 4) / 32;
    final cc = 151 * pow(ei, 3) / 96;
    final cd = 1097 * pow(ei, 4) / 512;
    final phi1 = mu +
        ca * sin(2 * mu) +
        cb * sin(4 * mu) +
        cc * sin(6 * mu) +
        cd * sin(8 * mu);

    final n0 = a.value / pow((1 - pow((e * sin(phi1)), 2)), (1 / 2.0));

    final r0 =
        a.value * (1 - e * e) / pow((1 - pow((e * sin(phi1)), 2)), (3 / 2.0));
    final fact1 = n0 * tan(phi1) / r0;

    final _a1 = 500000.0.toDistance() - E;
    final dd0 = _a1.value / (n0 * k0);
    final fact2 = dd0 * dd0 / 2;

    final t0 = pow(tan(phi1), 2);
    final Q0 = e1sq * pow(cos(phi1), 2);
    final fact3 =
        (5 + 3 * t0 + 10 * Q0 - 4 * Q0 * Q0 - 9 * e1sq) * pow(dd0, 4) / 24;

    final fact4 =
        (61 + 90 * t0 + 298 * Q0 + 45 * t0 * t0 - 252 * e1sq - 3 * Q0 * Q0) *
            pow(dd0, 6) /
            720;

    final lof1 = _a1.value / (n0 * k0);
    final lof2 = (1 + 2 * t0 + Q0) * pow(dd0, 3) / 6.0;
    final lof3 =
        (5 - 2 * Q0 + 28 * t0 - 3 * pow(Q0, 2) + 8 * e1sq + 24 * pow(t0, 2)) *
            pow(dd0, 5) /
            120;
    final _a2 = (lof1 - lof2 + lof3) / cos(phi1);
    final _a3 = _a2 * 180 / pi;

    var lat = 180 * (phi1 - fact1 * (fact2 + fact3 + fact4)) / pi;
    lat = northernHemisphere ? lat : -lat;

    var long = 6 * zone - 183.0 - _a3;

    return WGS(latitude: lat.toAngleDegree(), longitude: long.toAngleDegree());
  }
}
