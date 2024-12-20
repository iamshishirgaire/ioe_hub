import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/file_downloads/blocs/file_download_bloc/file_download_event.dart';
import 'package:ioe_hub/features/file_downloads/blocs/file_download_bloc/file_download_state.dart';
import 'package:ioe_hub/features/file_downloads/repository/file_download_repository.dart';

@Injectable()
class FileDownloadBloc extends Bloc<FileDownloadEvent, FileDownloadState> {
  final FileRepository fileRepository;

  FileDownloadBloc(this.fileRepository) : super(FileDownloadInitial()) {
    // Register event handler for downloading file
    on<DownloadFileEvent>(_onDownloadFile);

    // Register event handler for checking if a file exists
    on<CheckFileExistsEvent>(_onCheckFileExists);
  }

  // Handler for downloading the file
  Future<void> _onDownloadFile(
      DownloadFileEvent event, Emitter<FileDownloadState> emit) async {
    try {
      emit(FileDownloadInProgress(progress: 0.0));

      final filePath = await fileRepository
          .downloadFile(event.url, event.fileName, onProgress: (progress) {
        emit(FileDownloadInProgress(progress: progress));
      });

      emit(FileDownloadSuccess(filePath: filePath));
    } catch (error) {
      emit(FileDownloadFailure(errorMessage: error.toString()));
    }
  }

  // Handler for checking if the file exists
  Future<void> _onCheckFileExists(
      CheckFileExistsEvent event, Emitter<FileDownloadState> emit) async {
    try {
      final exists = await fileRepository.checkIfFileExists(event.fileName);
      if (exists) {
        emit(FileExistsState(filePath: "${event.fileName}.pdf"));
      } else {
        emit(FileDoesNotExistState());
      }
    } catch (error) {
      emit(FileDownloadFailure(errorMessage: error.toString()));
    }
  }
}
