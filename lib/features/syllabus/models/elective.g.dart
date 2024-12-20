// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elective.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Elective _$ElectiveFromJson(Map<String, dynamic> json) => Elective(
      (json['id'] as num).toInt(),
      json['groupName'] as String,
      (json['semesterId'] as num).toInt(),
    );

Map<String, dynamic> _$ElectiveToJson(Elective instance) => <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'semesterId': instance.semesterId,
    };

ElectiveSubject _$ElectiveSubjectFromJson(Map<String, dynamic> json) =>
    ElectiveSubject(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['electiveId'] as num).toInt(),
    );

Map<String, dynamic> _$ElectiveSubjectToJson(ElectiveSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'electiveId': instance.electiveId,
    };
