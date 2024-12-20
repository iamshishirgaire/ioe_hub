part of 'questions_bloc.dart';

sealed class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];
}

class LoadQuestions extends QuestionsEvent {
  final String? semester;
  final String? query;
  final int? page;
  final int? limit;

  const LoadQuestions({
    this.semester,
    this.query,
    this.page,
    this.limit,
  });
}
