import 'package:json_annotation/json_annotation.dart';

part 'subject_detail.g.dart';

@JsonSerializable()
class SubjectDetail {
  final int id;
  final String name;
  final String content;

  SubjectDetail({
    required this.id,
    required this.content,
    required this.name,
  });
  factory SubjectDetail.fromJson(Map<String, dynamic> json) =>
      _$SubjectDetailFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectDetailToJson(this);
}
