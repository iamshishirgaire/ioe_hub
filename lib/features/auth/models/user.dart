import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String userName;
  final String email;
  final String? fullName;
  final String profilePic;
  final String? college;

  const User({
    required this.id,
    required this.userName,
    required this.email,
    this.fullName,
    required this.profilePic,
    this.college,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
