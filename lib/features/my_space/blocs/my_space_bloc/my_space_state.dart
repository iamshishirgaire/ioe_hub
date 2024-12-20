// my_space_state.dart
import 'package:ioe_hub/features/syllabus/models/faculty.dart';
import 'package:ioe_hub/features/syllabus/models/semester.dart';

abstract class MySpaceState {}

class MySpaceInitial extends MySpaceState {}

class MySpaceLoading extends MySpaceState {}

class MySpaceLoaded extends MySpaceState {
  final Faculty faculty;
  final Semester semester;

  MySpaceLoaded({required this.faculty, required this.semester});
}

class MySpaceFacultiesLoaded extends MySpaceState {
  final List<Faculty> faculties;

  MySpaceFacultiesLoaded(this.faculties);
}

class MySpaceSemestersLoaded extends MySpaceState {
  final List<Semester> semesters;

  MySpaceSemestersLoaded(this.semesters);
}

class MySpaceError extends MySpaceState {
  final String message;

  MySpaceError(this.message);
}
