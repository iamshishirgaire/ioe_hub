import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:ioe_hub/core/api/dio.dart';
import 'package:path_provider/path_provider.dart';

@Injectable()
class FileRepository {
  final ApiClient _apiClient;
  FileRepository(this._apiClient);
  // Function to check if a file exists
  Future<bool> checkIfFileExists(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName.pdf';
    final file = File(filePath);

    return file.exists();
  }

  // Function to download a file and report progress
  Future<String> downloadFile(String url, String fileName,
      {Function(double)? onProgress}) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName.pdf';

    final dio = _apiClient.getDio();
    await dio.download(
      url,
      filePath,
      onReceiveProgress: (count, total) {
        onProgress?.call(count / total);
      },
    );
    return filePath;
  }
}
