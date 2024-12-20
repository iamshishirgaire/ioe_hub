import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/pastPaper/models/question.dart';
import 'package:ioe_hub/features/pastPaper/repository/questions_repository.dart';

part 'questions_event.dart';
part 'questions_state.dart';

@Injectable()
class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepository _questionsRepository;
  QuestionsBloc(this._questionsRepository) : super(QuestionsLoading()) {
    on<QuestionsEvent>((event, emit) async {
      if (event is LoadQuestions) {
        try {
          emit(QuestionsLoading());
          final questions = await _questionsRepository.getQuestions(
            event.semester,
            event.query,
            event.page,
            event.limit,
          );
          emit(QuestionsLoaded(
            questions: questions,
            semester: event.semester,
            page: event.page,
            limit: event.limit,
            query: event.query,
          ));
        } catch (e) {
          emit(QuestionsError(error: e.toString()));
        }
      }
    });
  }
}
