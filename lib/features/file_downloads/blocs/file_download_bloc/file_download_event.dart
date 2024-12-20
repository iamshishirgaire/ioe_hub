abstract class FileDownloadEvent {}

// Event to trigger file download
class DownloadFileEvent extends FileDownloadEvent {
  final String url;
  final String fileName;

  DownloadFileEvent(this.url, this.fileName);
}

// Event to check if the file exists locally
class CheckFileExistsEvent extends FileDownloadEvent {
  final String fileName;

  CheckFileExistsEvent(this.fileName);
}
