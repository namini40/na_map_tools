import 'package:flutter_test/flutter_test.dart';
import 'package:na_map_tools/models/constants.dart';
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

      expect(radian.value, radianRaw);
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

    group('Radian', () {
      test('to Degree', () {
        final radian = AngleRadian(radianSame);
        expect(radian.toDegree(), AngleDegree(degreeSame));
      });
      test('to DMS', () {
        final radian = AngleRadian(radianSame);
        expect(radian.toDMS(),
            AngleDMS(deg: dmsDegSame, min: dmsMinSame, sec: dmsSecSame));
      });
      test('to Radian', () {
        final radian = AngleRadian(radianSame);
        expect(radian.toRadian(), AngleRadian(radianSame));
      });
    });
  });

  group('testing Angle Units: add and subtract', () {
    double deg1 = 32.501245;
    double deg2 = 48.1458;

    double rad1 = 0.567253736247;
    double rad2 = 2.3654;

    int dmsDeg1 = 32;
    int dmsDeg2 = 36;

    int dmsMin1 = 30;
    int dmsMin2 = 58;

    double dmsSec1 = 4.482;
    double dmsSec2 = 29;

    test('Degree - and + (for less than 360)', () {
      var degObj1 = AngleDegree(deg1);
      var degObj2 = AngleDegree(deg2);
      var sum = degObj1 + degObj2;
      var sub = degObj2 - degObj1;

      expect(sum.value, deg1 + deg2);
      expect(sum, AngleDegree(deg1 + deg2));

      expect(sub.value, deg2 - deg1);
      expect(sub, AngleDegree(deg2 - deg1));
    });

    test('DMS - and + (for less than 360)', () {
      var dmsObj1 = AngleDMS(deg: dmsDeg1, min: dmsMin1, sec: dmsSec1);
      var dmsObj2 = AngleDMS(deg: dmsDeg2, min: dmsMin2, sec: dmsSec2);

      var dmsSumObj = dmsObj1 + dmsObj2;
      var dmsSubObj = dmsObj2 - dmsObj1;

      int dmsSumDeg = 69;
      int dmsSumMin = 28;
      double dmsSumSec = 33.482;
      int dmsSubDeg = 4;
      int dmsSubMin = 28;
      double dmsSubSec = 24.518;

      expect(dmsSumObj.degree, dmsSumDeg);
      expect(dmsSumObj.minute, dmsSumMin);
      expect(
          dmsSumObj.second
              .toStringAsFixed(anglePrecisionComparisonForDMSSeconds),
          dmsSumSec.toStringAsFixed(anglePrecisionComparisonForDMSSeconds));
      expect(
          dmsSumObj, AngleDMS(deg: dmsSumDeg, min: dmsSumMin, sec: dmsSumSec));

      expect(dmsSubObj.degree, dmsSubDeg);
      expect(dmsSubObj.minute, dmsSubMin);
      expect(
          dmsSubObj.second
              .toStringAsFixed(anglePrecisionComparisonForDMSSeconds),
          dmsSubSec.toStringAsFixed(anglePrecisionComparisonForDMSSeconds));
      expect(
          dmsSubObj, AngleDMS(deg: dmsSubDeg, min: dmsSubMin, sec: dmsSubSec));
    });
  });
}
