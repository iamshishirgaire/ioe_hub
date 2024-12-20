import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@Injectable()
class FileHandler {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  // Create or write to a file
  Future<File> writeFile(String fileName, String content) async {
    final file = await _localFile(fileName);
    return file.writeAsString(content);
  }

  // Read a file
  Future<String> readFile(String fileName) async {
    try {
      final file = await _localFile(fileName);
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // Return empty string if file doesn't exist or error occurs
      return '';
    }
  }

  // Update a file (write will override the content)
  Future<File> updateFile(String fileName, String newContent) async {
    return await writeFile(fileName, newContent);
  }

  // Delete a file
  Future<void> deleteFile(String fileName) async {
    try {
      final file = File(fileName);
      if (file.existsSync()) {
        await file.delete();
      }
    } catch (e) {
      rethrow;
    }
  }
}
