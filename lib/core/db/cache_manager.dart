import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CacheManagerService {
  final CacheManager _cacheManager = DefaultCacheManager();

  // Get file from the cache or download if not available
  Stream<FileResponse> getFile(String url, {bool withProgress = false}) {
    return _cacheManager.getFileStream(url, withProgress: withProgress);
  }

  // Download file and return the file
  Future<File> downloadFile(String url) async {
    final file = await _cacheManager.getSingleFile(url);
    return file;
  }

  // Remove file from cache
  Future<void> removeFile(String url) async {
    await _cacheManager.removeFile(url);
  }

  // Clear the entire cache
  Future<void> clearCache() async {
    await _cacheManager.emptyCache();
  }

  // Check if file exists in cache
  Future<bool> fileExists(String url) async {
    final fileInfo = await _cacheManager.getFileFromCache(url);
    return fileInfo != null;
  }

  // Retrieve file info (size, modification date, etc.)
  Future<FileInfo?> getFileInfo(String url) async {
    return _cacheManager.getFileFromCache(url);
  }
}
