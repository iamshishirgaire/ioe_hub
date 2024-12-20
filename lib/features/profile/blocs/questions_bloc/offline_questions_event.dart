part of 'offline_questions_bloc.dart';

sealed class OfflineQuestionsEvent extends Equatable {
  const OfflineQuestionsEvent();

  @override
  List<Object> get props => [];
}

class LoadOfflineQuestion extends OfflineQuestionsEvent {
  const LoadOfflineQuestion();
}

class AddOfflinequestion extends OfflineQuestionsEvent {
  final Offline question;
  const AddOfflinequestion({required this.question});
}

class DeleteOfflinequestion extends OfflineQuestionsEvent {
  final Offline question;
  const DeleteOfflinequestion({required this.question});
}
