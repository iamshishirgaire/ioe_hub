// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectDetail _$SubjectDetailFromJson(Map<String, dynamic> json) =>
    SubjectDetail(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SubjectDetailToJson(SubjectDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
    };
