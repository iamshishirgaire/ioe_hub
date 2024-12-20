import 'package:equatable/equatable.dart';

abstract class FacultyEvent extends Equatable {
  const FacultyEvent();

  @override
  List<Object> get props => [];
}

class LoadFaculties extends FacultyEvent {
  // This event triggers loading faculties data from the repository.
}
