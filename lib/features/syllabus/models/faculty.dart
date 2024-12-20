import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faculty.g.dart';

@JsonSerializable(explicitToJson: true)
class Faculty extends Equatable {
  final int id;
  final String name;
  final int numberOfSemesters;
  final int numberOfSubjects;
  final int numberOfElectiveGroups;

  const Faculty(
    this.numberOfElectiveGroups, {
    required this.id,
    required this.name,
    required this.numberOfSemesters,
    required this.numberOfSubjects,
  });

  factory Faculty.fromJson(Map<String, dynamic> json) =>
      _$FacultyFromJson(json);
  Map<String, dynamic> toJson() => _$FacultyToJson(this);

  @override
  List<Object?> get props => [id];
}
