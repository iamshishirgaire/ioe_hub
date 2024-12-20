import 'package:equatable/equatable.dart';
import 'package:ioe_hub/features/notes/models/note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object?> get props => [];
}

class FetchNotes extends NoteEvent {
  final int? semester;
  final String? query;
  final int? page;
  final int? limit;

  const FetchNotes({this.semester, this.query, this.page, this.limit});

  @override
  List<Object?> get props => [semester, query, page, limit];
}

class FetchNotesOfUser extends NoteEvent {
  final String userId;
  final int? page;
  final int? limit;

  const FetchNotesOfUser(this.userId, {this.page, this.limit});

  @override
  List<Object?> get props => [userId, page, limit];
}

class CreateNote extends NoteEvent {
  final Note note;

  const CreateNote(this.note);

  @override
  List<Object?> get props => [note];
}

class UpdateNote extends NoteEvent {
  final Note note;

  const UpdateNote(this.note);

  @override
  List<Object?> get props => [note];
}

class DeleteNote extends NoteEvent {
  final String noteId;

  const DeleteNote(this.noteId);

  @override
  List<Object?> get props => [noteId];
}

class RateNote extends NoteEvent {
  final String noteId;
  final String rating;

  const RateNote(this.noteId, this.rating);

  @override
  List<Object?> get props => [noteId, rating];
}
