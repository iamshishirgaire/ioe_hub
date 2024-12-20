import 'package:flutter_test/flutter_test.dart';
import 'package:ioe_hub/core/utils/map_course_to_icon.dart';

void main() {
  group('mapCourseToIcon', () {
    test('should return correct icon path for civil', () {
      expect(mapCourseToIcon('civil'), 'assets/icons/civil.svg');
    });

    test('should return correct icon path for industrial', () {
      expect(mapCourseToIcon('industrial'), 'assets/icons/industrial.svg');
    });

    test('should return correct icon path for computer', () {
      expect(mapCourseToIcon('computer'), 'assets/icons/computer.svg');
    });

    test('should return correct icon path for architecture', () {
      expect(mapCourseToIcon('architecture'), 'assets/icons/architecture.svg');
    });

    test('should return correct icon path for electronics_new', () {
      expect(mapCourseToIcon('electronics_new'),
          'assets/icons/electronics_new.svg');
    });

    test('should return correct icon path for electronics', () {
      expect(mapCourseToIcon('electronics'), 'assets/icons/electronics.svg');
    });

    test('should return correct icon path for electrical', () {
      expect(mapCourseToIcon('electrical'), 'assets/icons/electrical.svg');
    });

    test('should return correct icon path for automobile', () {
      expect(mapCourseToIcon('automobile'), 'assets/icons/automobile.svg');
    });

    test('should return correct icon path for aerospace', () {
      expect(mapCourseToIcon('aerospace'), 'assets/icons/aerospace.svg');
    });

    test('should return correct icon path for agriculture', () {
      expect(mapCourseToIcon('agriculture'), 'assets/icons/agriculture.svg');
    });

    test('should return correct icon path for mechanical', () {
      expect(mapCourseToIcon('mechanical'), 'assets/icons/mechanical.svg');
    });

    test('should return correct icon path for geomatics', () {
      expect(mapCourseToIcon('geomatics'), 'assets/icons/geomatics.svg');
    });

    test('should return null for unknown course', () {
      expect(mapCourseToIcon('unknown'), isNull);
    });

    test('should return null for unknown course ', () {
      expect(mapCourseToIcon(""), isNull);
    });
  });
}
