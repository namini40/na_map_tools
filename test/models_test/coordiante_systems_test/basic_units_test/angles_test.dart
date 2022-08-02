import 'package:flutter_test/flutter_test.dart';
import 'package:na_map_tools/models/coordinate_systems/coordinate_system_files.dart';

void main() {
  group('testing Angle Units: object creation and APIs', () {
    test('Degree: zero constructor', () {
      var degreeZero = AngleDegree.zero();

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

    test('Degree: main constructor', () {
      double degreeRaw = 32.501245;
      final deg = AngleDegree(degreeRaw);

      expect(deg.value, degreeRaw);
    });
    test('DMS: main constructor', () {
      int dmsRawDeg = 35;
      int dmsRawMinute = 12;
      double dmsRawSecond = 45.2;
      final dms =
          AngleDMS(deg: dmsRawDeg, min: dmsRawMinute, sec: dmsRawSecond);

      expect(dms.degree, dmsRawDeg);
      expect(dms.minute, dmsRawMinute);
      expect(dms.second, dmsRawSecond);
    });
    test('Radian: main constructor', () {
      double radianRaw = 2.124587;
      final radian = AngleRadian(radianRaw);

      expect(radian, radianRaw);
    });
  });

  group('testing Angle Units: converting', () {
    double degreeSame = 32.501245;
    double radianSame = 0.567253736247;
    int dmsDegSame = 32;
    int dmsMinSame = 30;
    double dmsSecSame = 4.482;

    group('Degree', () {
      test('to Degree', () {
        final degree = AngleDegree(degreeSame);
        expect(degree.toDegree(), AngleDegree(degreeSame));
      });
      test('to DMS', () {
        final degree = AngleDegree(degreeSame);
        expect(degree.toDMS(),
            AngleDMS(deg: dmsDegSame, min: dmsMinSame, sec: dmsSecSame));
      });
      test('to Radian', () {
        final degree = AngleDegree(degreeSame);
        expect(degree.toRadian(), AngleRadian(radianSame));
      });
    });

    group('DMS', () {
      test('to Degree', () {
        final dms = AngleDMS(deg: dmsDegSame, min: dmsMinSame, sec: dmsSecSame);
        expect(dms.toDegree(), AngleDegree(degreeSame));
      });
      test('to DMS', () {
        final dms = AngleDMS(deg: dmsDegSame, min: dmsMinSame, sec: dmsSecSame);
        expect(dms.toDMS(),
            AngleDMS(deg: dmsDegSame, min: dmsMinSame, sec: dmsSecSame));
      });
      test('to Radian', () {
        final dms = AngleDMS(deg: dmsDegSame, min: dmsMinSame, sec: dmsSecSame);
        expect(dms.toRadian(), AngleRadian(radianSame));
      });
    });
  });

  group('testing Angle Units: add and subtract', () {});
}
