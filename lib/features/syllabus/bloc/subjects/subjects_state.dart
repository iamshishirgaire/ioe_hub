import 'package:equatable/equatable.dart';
import 'package:ioe_hub/features/syllabus/models/elective.dart';
import 'package:ioe_hub/features/syllabus/models/subject.dart';
import 'package:ioe_hub/features/syllabus/models/subject_detail.dart';

abstract class SubjectsState extends Equatable {
  const SubjectsState();

  @override
  List<Object> get props => [];
}

class SubjectsLoading extends SubjectsState {
  // State when subjects are being loaded.
}

class SubjectDetailLoading extends SubjectsState {
  // State when subject detail is being loaded.
}

class SubjectsLoaded extends SubjectsState {
  final List<Subject> subjects;
  final List<Elective>? electives;

  const SubjectsLoaded(this.subjects, this.electives);

  @override
  List<Object> get props => [subjects];
}

class SubjectDetailLoaded extends SubjectsState {
  final SubjectDetail subject;
  const SubjectDetailLoaded(this.subject);
  @override
  List<Object> get props => [subject];
}

class SubjectsError extends SubjectsState {
  final String error;
  const SubjectsError(this.error);
  @override
  List<Object> get props => [error];
}

class SubjectDetailError extends SubjectsState {
  final String error;
  const SubjectDetailError(this.error);
  @override
  List<Object> get props => [error];
}
