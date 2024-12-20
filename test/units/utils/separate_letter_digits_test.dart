import 'package:flutter_test/flutter_test.dart';
import 'package:ioe_hub/core/utils/separate_letter_digits.dart';

void main() {
  group('convertToSemester', () {
    test('should convert "1sem" to "Semester 1"', () {
      expect(separateLettersDigits('1sem'), equals('Semester 1'));
    });

    test('should convert "2sem" to "Semester 2"', () {
      expect(separateLettersDigits('2sem'), equals('Semester 2'));
    });

    test('should convert "10sem" to "Semester 10"', () {
      expect(separateLettersDigits('10sem'), equals('Semester 10'));
    });

    test('should return the original string if format is incorrect', () {
      expect(separateLettersDigits('unknown'), equals('unknown'));
    });

    test('should return the original string if number is missing', () {
      expect(separateLettersDigits('sem'), equals('sem'));
    });
  });
}
