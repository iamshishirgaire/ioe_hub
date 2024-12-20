abstract class FileDownloadState {}

class FileDownloadInitial extends FileDownloadState {}

// State during file download
class FileDownloadInProgress extends FileDownloadState {
  final double progress;

  FileDownloadInProgress({required this.progress});
}

// State when file download is successful
class FileDownloadSuccess extends FileDownloadState {
  final String filePath;

  FileDownloadSuccess({required this.filePath});
}

// State when the file already exists
class FileExistsState extends FileDownloadState {
  final String filePath;

  FileExistsState({required this.filePath});
}

// State when the file does not exist
class FileDoesNotExistState extends FileDownloadState {}

// State when file download fails
class FileDownloadFailure extends FileDownloadState {
  final String errorMessage;

  FileDownloadFailure({required this.errorMessage});
}
