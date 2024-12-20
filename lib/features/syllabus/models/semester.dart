import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'semester.g.dart';

@JsonSerializable(explicitToJson: true)
class Semester extends Equatable {
  final int id;
  final String name;
  final int facultyId;
  final int numberOfSubjects;
  final int numberOfElectives;

  const Semester(
    this.numberOfElectives, {
    required this.id,
    required this.name,
    required this.numberOfSubjects,
    required this.facultyId,
  });

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);
  Map<String, dynamic> toJson() => _$SemesterToJson(this);

  @override
  List<Object?> get props => [id];
}
