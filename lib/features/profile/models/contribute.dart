import 'package:json_annotation/json_annotation.dart';

part 'contribute.g.dart';

@JsonSerializable()
class QuestionContribution {
  final String? id;
  final String question;
  final String faculty;
  final int year;
  final int semester;

  QuestionContribution({
    this.id,
    required this.question,
    required this.faculty,
    required this.year,
    required this.semester,
  });
  factory QuestionContribution.fromJson(Map<String, dynamic> json) =>
      _$QuestionContributionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionContributionToJson(this);
}
