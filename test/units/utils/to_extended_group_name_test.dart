import 'package:flutter_test/flutter_test.dart';
import 'package:ioe_hub/core/utils/group_name_convert.dart';

void main() {
  group('convertToSemester', () {
    test('should convert "1sem" to "Semester 1"', () {
      expect(toExtendedGroupName('e1'), equals('Elective 1'));
    });
    test('should convert e2" to "Elective 2"', () {
      expect(toExtendedGroupName('e2'), equals('Elective 2'));
    });
    test('should convert "e10" to "Elective 10"', () {
      expect(toExtendedGroupName('e10'), equals('Elective 10'));
    });
  });
}
