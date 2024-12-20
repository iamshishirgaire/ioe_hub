import 'package:equatable/equatable.dart';

sealed class ReportBugEvent extends Equatable {
  const ReportBugEvent();

  @override
  List<Object> get props => [];
}

class SubmitBugReport extends ReportBugEvent {
  final String title;
  final String description;

  const SubmitBugReport({required this.title, required this.description});
}

class FetchBugReports extends ReportBugEvent {}
