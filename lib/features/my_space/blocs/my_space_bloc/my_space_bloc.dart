import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_event.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_state.dart';
import 'package:ioe_hub/features/my_space/repository/my_space_repository.dart';

@Injectable()
class MySpaceBloc extends Bloc<MySpaceEvent, MySpaceState> {
  final MySpaceRepository _mySpaceRepository;

  MySpaceBloc(this._mySpaceRepository) : super(MySpaceInitial()) {
    on<LoadCurrentSpaceEvent>(_onLoadCurrentSpace);
    on<SaveCurrentSpaceEvent>(_onSaveCurrentSpace);
    on<LoadFacultiesEvent>(_onLoadFaculties);
  }

  Future<void> _onLoadCurrentSpace(
      LoadCurrentSpaceEvent event, Emitter<MySpaceState> emit) async {
    emit(MySpaceLoading());
    try {
      final faculty = await _mySpaceRepository.getCurrentFaculty();
      final semester = await _mySpaceRepository.getCurrentSemester();

      if (faculty != null && semester != null) {
        emit(MySpaceLoaded(faculty: faculty, semester: semester));
      } else {
        emit(MySpaceError("No space found"));
      }
    } catch (e) {
      emit(MySpaceError("No space found"));
    }
  }

  Future<void> _onSaveCurrentSpace(
      SaveCurrentSpaceEvent event, Emitter<MySpaceState> emit) async {
    emit(MySpaceLoading());
    try {
      await _mySpaceRepository.saveCurrentSpace(event.faculty, event.semester);
      emit(MySpaceLoaded(faculty: event.faculty, semester: event.semester));
    } catch (e) {
      emit(MySpaceError(e.toString()));
    }
  }

  Future<void> _onLoadFaculties(
      LoadFacultiesEvent event, Emitter<MySpaceState> emit) async {
    emit(MySpaceLoading());
    try {
      final faculties = await _mySpaceRepository.getAllFaculties();
      emit(MySpaceFacultiesLoaded(faculties));
    } catch (e) {
      emit(MySpaceError(e.toString()));
    }
  }
}
