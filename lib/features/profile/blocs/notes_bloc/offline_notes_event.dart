part of 'offline_notes_bloc.dart';

sealed class OfflineNotesEvent extends Equatable {
  const OfflineNotesEvent();

  @override
  List<Object> get props => [];
}

class LoadOfflineNotes extends OfflineNotesEvent {
  const LoadOfflineNotes();
}

class AddOfflineNote extends OfflineNotesEvent {
  final Offline note;
  const AddOfflineNote({required this.note});
}

class DeleteOfflineNote extends OfflineNotesEvent {
  final Offline note;
  const DeleteOfflineNote({required this.note});
}
