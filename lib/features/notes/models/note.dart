import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  final String id;
  final int semester;
  final String subject;
  final String previewLink;
  final double rating;
  final int noOfRatings;
  final String uploadedOn;
  final String uploadedBy;
  Note(
    this.rating,
    this.noOfRatings,
    this.uploadedOn,
    this.uploadedBy, {
    required this.id,
    required this.semester,
    required this.subject,
    required this.previewLink,
  });
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
