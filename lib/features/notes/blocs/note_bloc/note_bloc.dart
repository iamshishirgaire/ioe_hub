import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/notes/blocs/note_bloc/note_event.dart';
import 'package:ioe_hub/features/notes/blocs/note_bloc/note_state.dart';
import 'package:ioe_hub/features/notes/repository/note_repository.dart';

@Injectable()
class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;

  NoteBloc(this.noteRepository) : super(NoteInitial()) {
    on<FetchNotes>(_onFetchNotes);
    on<FetchNotesOfUser>(_onFetchNotesOfUser);
    on<CreateNote>(_onCreateNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
    on<RateNote>(_onRateNote);
  }

  Future<void> _onFetchNotes(FetchNotes event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final notes = await noteRepository.getNotes(
          event.semester, event.query, event.page, event.limit);
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  Future<void> _onFetchNotesOfUser(
      FetchNotesOfUser event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final userNotes = await noteRepository.getNotesOfUser(
          event.page, event.limit, event.userId);
      emit(NoteUserLoaded(userNotes));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  Future<void> _onCreateNote(CreateNote event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final message = await noteRepository.createNote(event.note);
      emit(NoteSuccess(message));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  Future<void> _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final message = await noteRepository.updateNote(event.note);
      emit(NoteSuccess(message));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final message = await noteRepository.deleteNote(event.noteId);
      emit(NoteSuccess(message));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  Future<void> _onRateNote(RateNote event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final message = await noteRepository.rateNote(event.noteId, event.rating);
      emit(NoteSuccess(message));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
