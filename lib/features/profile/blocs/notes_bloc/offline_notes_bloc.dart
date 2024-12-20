import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/profile/models/offline.dart';
import 'package:ioe_hub/features/profile/repository/offline_repository.dart';

part 'offline_notes_event.dart';
part 'offline_notes_state.dart';

@Injectable()
class OfflineNotesBloc extends Bloc<OfflineNotesEvent, OfflineNotesState> {
  final OfflineRepository offlineRepository;
  OfflineNotesBloc(
    this.offlineRepository,
  ) : super(OfflineNotesLoading()) {
    on<LoadOfflineNotes>((event, emit) async {
      try {
        var offlineNotes = await offlineRepository.getAllOfflineNotes();
        emit(OfflineNotesLoaded(offlineNotes: offlineNotes));
      } catch (e) {
        emit(const OfflineNotesError(message: "Failed to load"));
      }
    });

    on<AddOfflineNote>((event, emit) async {
      try {
        await offlineRepository.saveOfflineNote(event.note);
        emit(const OfflineNoteTransactionSuccess(
            message: "Note added successfully"));
        emit(OfflineNotesLoaded(
            offlineNotes: await offlineRepository.getAllOfflineNotes()));
      } catch (e) {
        emit(const OfflineNoteTransactionError(message: "Failed to add note"));
      }
    });
    on<DeleteOfflineNote>((event, emit) async {
      try {
        await offlineRepository.deleteOfflineNote(event.note);
        emit(const OfflineNoteTransactionSuccess(
            message: "Note deleted successfully"));
        emit(OfflineNotesLoaded(
            offlineNotes: await offlineRepository.getAllOfflineNotes()));
      } catch (e) {
        emit(const OfflineNoteTransactionError(
            message: "Failed to delete note"));
      }
    });
  }
}
