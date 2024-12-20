import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  String id;
  String semester;
  String subject;
  String previewLink;
  Question(
      {required this.id,
      required this.semester,
      required this.subject,
      required this.previewLink});
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
