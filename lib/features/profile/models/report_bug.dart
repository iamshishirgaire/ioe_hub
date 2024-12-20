import 'package:json_annotation/json_annotation.dart';

part 'report_bug.g.dart';

@JsonSerializable()
class BugReport {
  final String? id;
  final String title;
  final String description;
  final DateTime reportedAt;
  final String status;

  BugReport({
    this.id,
    required this.title,
    required this.description,
    required this.reportedAt,
    required this.status,
  });
  factory BugReport.fromJson(Map<String, dynamic> json) =>
      _$BugReportFromJson(json);
  Map<String, dynamic> toJson() => _$BugReportToJson(this);
}
