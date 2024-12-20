import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/profile/blocs/contribute_bloc/contribute_event.dart';
import 'package:ioe_hub/features/profile/blocs/contribute_bloc/contribute_state.dart';
import 'package:ioe_hub/features/profile/repository/contribute_repository.dart';

@Injectable()
class ContributionBloc extends Bloc<ContributionEvent, ContributionState> {
  final QuestionRepository questionRepository;

  ContributionBloc({required this.questionRepository})
      : super(ContributionInitial()) {
    on<SubmitQuestion>((event, emit) async {
      emit(ContributionLoading());

      try {
        await questionRepository.submitQuestion(
          question: event.question,
          faculty: event.faculty,
          year: event.year,
          semester: event.semester,
        );
        emit(ContributionSuccess());
      } catch (e) {
        emit(ContributionFailure(e.toString()));
      }
    });
  }
}
