import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioe_hub/features/syllabus/bloc/semester/semester_event.dart';
import 'package:ioe_hub/features/syllabus/bloc/semester/semester_state.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

class SemestersBloc extends Bloc<SemestersEvent, SemestersState> {
  final FacultyRepository facultyRepository;

  SemestersBloc(this.facultyRepository) : super(SemesterLoading()) {
    on<LoadSemesters>(_onLoadSemesters);
  }

  Future<void> _onLoadSemesters(
      LoadSemesters event, Emitter<SemestersState> emit) async {
    try {
      emit(SemesterLoading()); // Emit loading state
      final faculties =
          await facultyRepository.getAllSemesters(event.courseId); // Fetch data
      emit(SemesterLoaded(faculties)); // Emit loaded state
    } catch (error) {
      emit(SemesterError(error.toString())); // Emit error state
    }
  }
}
