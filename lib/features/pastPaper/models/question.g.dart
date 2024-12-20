// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      semester: json['semester'] as String,
      subject: json['subject'] as String,
      previewLink: json['previewLink'] as String,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'semester': instance.semester,
      'subject': instance.subject,
      'previewLink': instance.previewLink,
    };
