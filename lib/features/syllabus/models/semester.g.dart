// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      (json['numberOfElectives'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      numberOfSubjects: (json['numberOfSubjects'] as num).toInt(),
      facultyId: (json['facultyId'] as num).toInt(),
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'facultyId': instance.facultyId,
      'numberOfSubjects': instance.numberOfSubjects,
      'numberOfElectives': instance.numberOfElectives,
    };
