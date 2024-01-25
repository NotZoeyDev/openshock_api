import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ObjectBaseResponse {
  ObjectBaseResponse({ this.message, this.data });

  factory ObjectBaseResponse.fromJson(Map<String, dynamic> json) => _$ObjectBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ObjectBaseResponseToJson(this);

  final String? message;
  final dynamic data;
}

@JsonSerializable()
class GuidBaseResponse {
  GuidBaseResponse({ required this.data, this.message });

  factory GuidBaseResponse.fromJson(Map<String, dynamic> json) => _$GuidBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GuidBaseResponseToJson(this);

  final String? message;
  final String data;
}

@JsonSerializable()
class StringBaseResponse {
  StringBaseResponse({ this.data, this.message });

  factory StringBaseResponse.fromJson(Map<String, dynamic> json) => _$StringBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StringBaseResponseToJson(this);

  final String? message;
  final String? data;
}

@JsonSerializable()
class BooleanBaseResponse {
  BooleanBaseResponse({ this.data, this.message });

  factory BooleanBaseResponse.fromJson(Map<String, dynamic> json) => _$BooleanBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BooleanBaseResponseToJson(this);

  final String? message;
  final bool? data;
}
