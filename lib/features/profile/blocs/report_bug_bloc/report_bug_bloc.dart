import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/profile/blocs/report_bug_bloc/report_bug_event.dart';
import 'package:ioe_hub/features/profile/blocs/report_bug_bloc/report_bug_state.dart';
import 'package:ioe_hub/features/profile/repository/report_bug_repository.dart';

@Injectable()
class ReportBugBloc extends Bloc<ReportBugEvent, ReportBugState> {
  final BugRepository bugRepository;

  ReportBugBloc({required this.bugRepository}) : super(BugReportInitial()) {
    on<SubmitBugReport>((event, emit) async {
      emit(BugReportLoading());

      try {
        await bugRepository.submitBugReport(event.title, event.description);
        emit(BugReportSubmissionSuccess());
      } catch (e) {
        emit(BugReportFailure(e.toString()));
      }
    });

    on<FetchBugReports>((event, emit) async {
      emit(BugReportLoading());

      try {
        final reports = await bugRepository.fetchBugReports();
        emit(BugReportSuccess(reports));
      } catch (e) {
        emit(BugReportFailure(e.toString()));
      }
    });
  }
}
