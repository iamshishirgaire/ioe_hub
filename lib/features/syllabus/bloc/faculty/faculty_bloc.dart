import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

import 'faculty_event.dart';
import 'faculty_state.dart';

class FacultyBloc extends Bloc<FacultyEvent, FacultyState> {
  final FacultyRepository facultyRepository;

  FacultyBloc(this.facultyRepository) : super(FacultyLoading()) {
    on<LoadFaculties>(_onLoadFaculties);
  }

  Future<void> _onLoadFaculties(
      LoadFaculties event, Emitter<FacultyState> emit) async {
    try {
      emit(FacultyLoading()); // Emit loading state
      final faculties = await facultyRepository.getAllFaculties(); // Fetch data
      emit(FacultyLoaded(faculties)); // Emit loaded state
    } catch (error) {
      emit(FacultyError(error.toString())); // Emit error state
    }
  }
}
