// my_space_event.dart
import 'package:ioe_hub/features/syllabus/models/faculty.dart';
import 'package:ioe_hub/features/syllabus/models/semester.dart';

abstract class MySpaceEvent {}

class LoadCurrentSpaceEvent extends MySpaceEvent {}

class SaveCurrentSpaceEvent extends MySpaceEvent {
  final Faculty faculty;
  final Semester semester;

  SaveCurrentSpaceEvent(this.faculty, this.semester);
}

class LoadFacultiesEvent extends MySpaceEvent {}

class LoadSemestersEvent extends MySpaceEvent {
  final Faculty facultyId;

  LoadSemestersEvent(this.facultyId);
}
