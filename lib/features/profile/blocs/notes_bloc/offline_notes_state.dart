part of 'offline_notes_bloc.dart';

sealed class OfflineNotesState extends Equatable {
  const OfflineNotesState();

  @override
  List<Object> get props => [];
}

final class OfflineNotesLoading extends OfflineNotesState {}

final class OfflineNotesLoaded extends OfflineNotesState {
  final List<Offline> offlineNotes;
  const OfflineNotesLoaded({required this.offlineNotes});
}

final class OfflineNotesError extends OfflineNotesState {
  final String message;
  const OfflineNotesError({required this.message});
}

final class OfflineNoteTransactionError extends OfflineNotesState {
  final String message;
  const OfflineNoteTransactionError({required this.message});
}

final class OfflineNoteTransactionSuccess extends OfflineNotesState {
  final String message;
  const OfflineNoteTransactionSuccess({required this.message});
}
