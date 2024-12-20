// writes a file to secure storage and returns the path to the file

import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

Future<String> saveToDevice(String fileName, Uint8List file) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = directory.path;
  // final file = File('$filePath/$fileName');
  // await file.writeAsBytes();
  return filePath;
}
