// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      (json['rating'] as num).toDouble(),
      (json['noOfRatings'] as num).toInt(),
      json['uploadedOn'] as String,
      json['uploadedBy'] as String,
      id: json['id'] as String,
      semester: (json['semester'] as num).toInt(),
      subject: json['subject'] as String,
      previewLink: json['previewLink'] as String,
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'semester': instance.semester,
      'subject': instance.subject,
      'previewLink': instance.previewLink,
      'rating': instance.rating,
      'noOfRatings': instance.noOfRatings,
      'uploadedOn': instance.uploadedOn,
      'uploadedBy': instance.uploadedBy,
    };
