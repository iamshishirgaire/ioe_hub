// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionContribution _$QuestionContributionFromJson(
        Map<String, dynamic> json) =>
    QuestionContribution(
      id: json['id'] as String?,
      question: json['question'] as String,
      faculty: json['faculty'] as String,
      year: (json['year'] as num).toInt(),
      semester: (json['semester'] as num).toInt(),
    );

Map<String, dynamic> _$QuestionContributionToJson(
        QuestionContribution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'faculty': instance.faculty,
      'year': instance.year,
      'semester': instance.semester,
    };
