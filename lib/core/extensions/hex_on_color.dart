import 'dart:ui';

extension ColorHex on Color {
  String toHex() {
    return '#${value.toRadixString(16).padLeft(8, '0')}';
  }
}
