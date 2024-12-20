// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faculty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faculty _$FacultyFromJson(Map<String, dynamic> json) => Faculty(
      (json['numberOfElectiveGroups'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      numberOfSemesters: (json['numberOfSemesters'] as num).toInt(),
      numberOfSubjects: (json['numberOfSubjects'] as num).toInt(),
    );

Map<String, dynamic> _$FacultyToJson(Faculty instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numberOfSemesters': instance.numberOfSemesters,
      'numberOfSubjects': instance.numberOfSubjects,
      'numberOfElectiveGroups': instance.numberOfElectiveGroups,
    };
