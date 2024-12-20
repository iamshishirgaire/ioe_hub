import 'package:json_annotation/json_annotation.dart';

part 'offline.g.dart';

@JsonSerializable()
class Offline {
  int? id;
  final String name;
  final String type;
  final String path;
  final String fileId;

  Offline({
    required this.fileId,
    required this.name,
    required this.type,
    required this.path,
  });
  factory Offline.fromJson(Map<String, dynamic> json) =>
      _$OfflineFromJson(json);
  Map<String, dynamic> toJson() => _$OfflineToJson(this);
}
