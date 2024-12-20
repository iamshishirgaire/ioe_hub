import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension ColorHex on Color {
  String toHex() {
    return '#${value.toRadixString(16).padLeft(8, '0')}';
  }
}

void main() {
  group('ColorHex Extension', () {
    test('should convert color to hex string correctly', () {
      Color color = const Color(0xFF4285F4);
      String hexValue = color.toHex();
      expect(hexValue, '#ff4285f4');
    });

    test('should handle color with transparency', () {
      Color colorWithTransparency = const Color(0x804285F4); // 50% transparent
      String hexValue = colorWithTransparency.toHex();
      expect(hexValue, '#804285f4');
    });

    test('should handle black color', () {
      Color black = const Color(0xFF000000);
      String hexValue = black.toHex();
      expect(hexValue, '#ff000000');
    });
    test('should handle flutter color format', () {
      Color black = Colors.black;
      String hexValue = black.toHex();
      expect(hexValue, '#ff000000');
    });
  });
}
