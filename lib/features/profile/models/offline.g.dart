// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offline _$OfflineFromJson(Map<String, dynamic> json) => Offline(
      fileId: json['fileId'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      path: json['path'] as String,
    )..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$OfflineToJson(Offline instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'path': instance.path,
      'fileId': instance.fileId,
    };
