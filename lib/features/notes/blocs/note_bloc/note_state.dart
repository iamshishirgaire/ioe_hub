import 'package:equatable/equatable.dart';
import 'package:ioe_hub/features/notes/models/note.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final List<Note> notes;

  const NoteLoaded(this.notes);

  @override
  List<Object?> get props => [notes];
}

class NoteUserLoaded extends NoteState {
  final List<Note> userNotes;

  const NoteUserLoaded(this.userNotes);

  @override
  List<Object?> get props => [userNotes];
}

class NoteSuccess extends NoteState {
  final String message;

  const NoteSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class NoteFailure extends NoteState {
  final String error;

  const NoteFailure(this.error);

  @override
  List<Object?> get props => [error];
}
