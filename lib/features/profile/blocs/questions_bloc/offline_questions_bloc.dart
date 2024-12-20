import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/profile/models/offline.dart';
import 'package:ioe_hub/features/profile/repository/offline_repository.dart';

part 'offline_questions_event.dart';
part 'offline_questions_state.dart';

@Injectable()
class OfflineQuestionsBloc
    extends Bloc<OfflineQuestionsEvent, OfflineQuestionsState> {
  final OfflineRepository offlineRepository;
  OfflineQuestionsBloc(
    this.offlineRepository,
  ) : super(OfflineQuestionsLoading()) {
    on<LoadOfflineQuestion>((event, emit) async {
      try {
        var questions = await offlineRepository.getAllOfflineQuestions();
        emit(OfflineQuestionsLoaded(offlineQuestions: questions));
      } catch (e) {
        emit(const OfflineQuestionsError(message: "Failed to load"));
      }
    });

    on<AddOfflinequestion>((event, emit) async {
      try {
        await offlineRepository.saveOfflineNote(event.question);
        emit(const OfflineQuestionTransactionSuccess(
            message: "Question added successfully"));
        emit(OfflineQuestionsLoaded(
            offlineQuestions: await offlineRepository.getAllOfflineNotes()));
      } catch (e) {
        emit(const OfflineQuestionTransactionError(
            message: "Failed to add question"));
      }
    });

    on<DeleteOfflinequestion>((event, emit) async {
      try {
        await offlineRepository.deleteOfflineQuestion(event.question);
        emit(const OfflineQuestionTransactionSuccess(
            message: "Question deleted successfully"));
        emit(OfflineQuestionsLoaded(
            offlineQuestions:
                await offlineRepository.getAllOfflineQuestions()));
      } catch (e) {
        emit(const OfflineQuestionTransactionError(
            message: "Failed to delete question"));
      }
    });
  }
}
