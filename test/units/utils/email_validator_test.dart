import 'package:flutter_test/flutter_test.dart';
import 'package:ioe_hub/core/utils/validator.dart';

void main() {
  group('validateEmail', () {
    test('should validate "iamshishir@gmail.com"', () {
      expect(isValidEmail('iamshishir@gmail.com'), equals(null));
    });
    //test empty string
    test('should validate ""', () {
      expect(isValidEmail(''), equals("Enter an email"));
    });
    test('should validate "@gmail.com"', () {
      expect(isValidEmail('@gmail.com'), equals("Enter a valid email"));
    });
    test('should validate "iamshishir@gmail"', () {
      expect(isValidEmail('iamshishir@gmail'), equals("Enter a valid email"));
    });
  });
}
