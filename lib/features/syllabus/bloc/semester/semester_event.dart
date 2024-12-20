import 'package:equatable/equatable.dart';

abstract class SemestersEvent extends Equatable {
  const SemestersEvent();

  @override
  List<Object> get props => [];
}

class LoadSemesters extends SemestersEvent {
  final int courseId;
  const LoadSemesters({required this.courseId});
  // This event triggers loading semesters data from the repository.
}
