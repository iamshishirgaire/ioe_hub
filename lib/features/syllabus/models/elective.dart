import 'package:json_annotation/json_annotation.dart';

part 'elective.g.dart';

@JsonSerializable()
class Elective {
  final int id;
  final String groupName;
  final int semesterId;
  Elective(this.id, this.groupName, this.semesterId);

  factory Elective.fromJson(Map<String, dynamic> json) =>
      _$ElectiveFromJson(json);
  Map<String, dynamic> toJson() => _$ElectiveToJson(this);
}

@JsonSerializable()
class ElectiveSubject {
  final int id;
  final String name;
  final int electiveId;
  ElectiveSubject(
    this.id,
    this.name,
    this.electiveId,
  );

  factory ElectiveSubject.fromJson(Map<String, dynamic> json) =>
      _$ElectiveSubjectFromJson(json);
  Map<String, dynamic> toJson() => _$ElectiveSubjectToJson(this);
}
