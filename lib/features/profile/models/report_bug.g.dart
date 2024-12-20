// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_bug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BugReport _$BugReportFromJson(Map<String, dynamic> json) => BugReport(
      id: json['id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      reportedAt: DateTime.parse(json['reportedAt'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$BugReportToJson(BugReport instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'reportedAt': instance.reportedAt.toIso8601String(),
      'status': instance.status,
    };
