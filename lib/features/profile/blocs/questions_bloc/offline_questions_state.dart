part of 'offline_questions_bloc.dart';

sealed class OfflineQuestionsState extends Equatable {
  const OfflineQuestionsState();

  @override
  List<Object> get props => [];
}

final class OfflineQuestionsLoading extends OfflineQuestionsState {}

final class OfflineQuestionsLoaded extends OfflineQuestionsState {
  final List<Offline> offlineQuestions;
  const OfflineQuestionsLoaded({required this.offlineQuestions});
}

final class OfflineQuestionsError extends OfflineQuestionsState {
  final String message;
  const OfflineQuestionsError({required this.message});
}

final class OfflineQuestionTransactionError extends OfflineQuestionsState {
  final String message;
  const OfflineQuestionTransactionError({required this.message});
}

final class OfflineQuestionTransactionSuccess extends OfflineQuestionsState {
  final String message;
  const OfflineQuestionTransactionSuccess({required this.message});
}
