part of 'questions_bloc.dart';

sealed class QuestionsState {
  const QuestionsState();
}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoading extends QuestionsState {}

final class QuestionsLoaded extends QuestionsState {
  final List<Question> questions;
  final int? page;
  final int? limit;
  final String? query;
  final String? semester;

  const QuestionsLoaded(
      {this.page,
      this.limit,
      this.query,
      this.semester,
      required this.questions});
}

final class QuestionsError extends QuestionsState {
  final String error;

  const QuestionsError({required this.error});
}
