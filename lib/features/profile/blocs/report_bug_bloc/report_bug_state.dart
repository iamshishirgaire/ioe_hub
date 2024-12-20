import 'package:equatable/equatable.dart';
import 'package:ioe_hub/features/profile/models/report_bug.dart';

abstract class ReportBugState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BugReportInitial extends ReportBugState {}

class BugReportLoading extends ReportBugState {}

class BugReportSuccess extends ReportBugState {
  final List<BugReport> bugReports;

  BugReportSuccess(this.bugReports);

  @override
  List<Object?> get props => [bugReports];
}

class BugReportFailure extends ReportBugState {
  final String error;

  BugReportFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class BugReportSubmissionSuccess extends ReportBugState {}
