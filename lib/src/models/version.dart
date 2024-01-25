import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable()
class VersionResponse {
  VersionResponse({ required this.currentTime, this.commit, this.version });

  factory VersionResponse.fromJson(Map<String, dynamic> json) => _$VersionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VersionResponseToJson(this);

  final String? version;
  final String? commit;
  final DateTime currentTime;
}

@JsonSerializable()
class VersionResponseBaseResponse {
  VersionResponseBaseResponse({ required this.message, required this.data });

  factory VersionResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$VersionResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VersionResponseBaseResponseToJson(this);
  
  final String? message;
  final VersionResponse data;
}
