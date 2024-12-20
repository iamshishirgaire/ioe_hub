import 'package:equatable/equatable.dart';

abstract class ContributionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitQuestion extends ContributionEvent {
  final String question;
  final String faculty;
  final int year;
  final int semester;

  SubmitQuestion({
    required this.question,
    required this.faculty,
    required this.year,
    required this.semester,
  });

  @override
  List<Object?> get props => [question, faculty, year, semester];
}
