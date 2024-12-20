import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_event.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_state.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

class SubjectsBloc extends Bloc<SubjectsEvent, SubjectsState> {
  final FacultyRepository facultyRepository;

  SubjectsBloc(this.facultyRepository) : super(SubjectsLoading()) {
    on<LoadSubjects>(_onLoadSubjects);
  }

  Future<void> _onLoadSubjects(
      LoadSubjects event, Emitter<SubjectsState> emit) async {
    try {
      emit(SubjectsLoading());
      if (event.electiveGroupId != null) {
        final subjects = await facultyRepository.getAllElectiveSubjects(
          event.electiveGroupId!,
        );

        emit(SubjectsLoaded(subjects, null));
      } else {
        final subjects = await facultyRepository.getAllSubjects(
          event.semesterId,
        );
        final electives = await facultyRepository.getElectiveGroups(
          event.semesterId,
        );
        emit(SubjectsLoaded(subjects, electives));
      }
    } catch (error) {
      emit(SubjectsError(error.toString()));
    }
  }
}
