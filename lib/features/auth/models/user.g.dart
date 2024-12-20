// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String?,
      profilePic: json['profilePic'] as String,
      college: json['college'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'fullName': instance.fullName,
      'profilePic': instance.profilePic,
      'college': instance.college,
    };
