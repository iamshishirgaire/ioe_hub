import 'package:flutter_test/flutter_test.dart';
import 'package:ioe_hub/core/utils/snake_case.dart';

void main() {
  group('toTitleCase', () {
    test('converts snake_case to Title Case', () {
      expect(toTitleCase('electronics_new'), equals('Electronics New'));
      expect(toTitleCase('hello_world'), equals('Hello World'));
      expect(toTitleCase('flutter_dev'), equals('Flutter Dev'));
    });

    test('handles single word', () {
      expect(toTitleCase('flutter'), equals('Flutter'));
    });

    test('handles empty string', () {
      expect(toTitleCase(''), equals(''));
    });

    test('handles multiple underscores', () {
      expect(toTitleCase('dart_is_awesome'), equals('Dart Is Awesome'));
      expect(toTitleCase('this_is_a_test'), equals('This Is A Test'));
    });

    test('handles already capitalized words', () {
      expect(toTitleCase('FLUTTER_DEV'), equals('Flutter Dev'));
      expect(toTitleCase('Flutter_Dev'), equals('Flutter Dev'));
    });
    test('handles roman numerals', () {
      expect(toTitleCase('eng_drawing_ii'), equals('Eng Drawing II'));
      expect(toTitleCase('Flutter_Dev'), equals('Flutter Dev'));
    });
  });
}
