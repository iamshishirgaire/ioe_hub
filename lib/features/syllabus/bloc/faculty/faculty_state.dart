import 'package:equatable/equatable.dart';
import 'package:ioe_hub/features/syllabus/models/faculty.dart';

abstract class FacultyState extends Equatable {
  const FacultyState();

  @override
  List<Object> get props => [];
}

class FacultyLoading extends FacultyState {
  // State when faculties are being loaded.
}

class FacultyLoaded extends FacultyState {
  final List<Faculty> faculties;

  const FacultyLoaded(this.faculties);

  @override
  List<Object> get props => [faculties];
}

class FacultyError extends FacultyState {
  final String error;

  const FacultyError(this.error);

  @override
  List<Object> get props => [error];
}
