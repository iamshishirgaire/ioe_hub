import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_event.dart';
import 'package:ioe_hub/features/syllabus/bloc/subjects/subjects_state.dart';
import 'package:ioe_hub/features/syllabus/repository/syllabus_repository.dart';

class SubjectsDetailBloc extends Bloc<SubjectsEvent, SubjectsState> {
  final FacultyRepository facultyRepository;

  SubjectsDetailBloc(this.facultyRepository) : super(SubjectDetailLoading()) {
    on<LoadSubjectDetail>(_onLoadSubjectDetails);
  }

  Future<void> _onLoadSubjectDetails(
      LoadSubjectDetail event, Emitter<SubjectsState> emit) async {
    try {
      emit(SubjectDetailLoading()); // Emit loading state
      if (event.electiveSubjectId != null) {
        final subjects = await facultyRepository.getElectiveSubjectDetail(
          event.electiveSubjectId!,
        );
        emit(SubjectDetailLoaded(subjects));
      } else {
        final subjects = await facultyRepository.getSubjectDetail(
          event.subjectId,
        );
        emit(SubjectDetailLoaded(subjects));
      }
    } catch (error) {
      emit(SubjectDetailError(error.toString())); // Emit error state
    }
  }
}
