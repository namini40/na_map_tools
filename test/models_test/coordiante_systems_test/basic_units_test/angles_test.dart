import 'package:flutter_test/flutter_test.dart';
import 'package:na_map_tools/models/coordinate_systems/coordinate_system_files.dart';

void main() {
  group('testing Angle Units: object creation and APIs', () {
    double degreeRaw = 32.501245;
    int dmsRawDeg = 35;
    int dmsRawMinute = 12;
    double dmsRawSecond = 45.2;
    double radianRaw = 2.124587;

    test('Degree: zero constructor', () {
      var degreeZero = AngleDegree.zero();

      print(degreeZero.value);
      expect(degreeZero.value, 0.0);
    });

    test('DMS: zero constructor', () {
      var dmsZero = AngleDMS.zero();

      expect(dmsZero.degree, 0);
      expect(dmsZero.minute, 0);
      expect(dmsZero.second, 0.0);
    });

    test('Radian: zero constructor', () {
      var radianZero = AngleRadian.zero();

      expect(radianZero.value, 0.0);
    });

    final deg = AngleDegree(degreeRaw);
    final dms = AngleDMS(dmsRawDeg, dmsRawMinute, dmsRawSecond);
    final radian = AngleRadian(radianRaw);

    test('if values match what they are given', () {
      expect(deg.value, degreeRaw);
      expect(dms.degree, dmsRawDeg);
      expect(dms.minute, dmsRawMinute);
      expect(dms.second, dmsRawSecond);
      expect(radian.value, radianRaw);
    });
  });

  group('testing Angle Units: converting', () {});

  group('testing Angle Units: add and subtract', () {});
}
