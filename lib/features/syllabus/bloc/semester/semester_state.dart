import 'package:equatable/equatable.dart';
import 'package:ioe_hub/features/syllabus/models/semester.dart';

abstract class SemestersState extends Equatable {
  const SemestersState();

  @override
  List<Object> get props => [];
}

class SemesterLoading extends SemestersState {
  // State when faculties are being loaded.
}

class SemesterLoaded extends SemestersState {
  final List<Semester> semesters;

  const SemesterLoaded(this.semesters);

  @override
  List<Object> get props => [semesters];
}

class SemesterError extends SemestersState {
  final String error;

  const SemesterError(this.error);

  @override
  List<Object> get props => [error];
}
