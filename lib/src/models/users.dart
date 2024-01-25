import 'package:json_annotation/json_annotation.dart';
import 'package:openshock_api/openshock_api.dart';

part 'users.g.dart';

@JsonSerializable()
class SelfResponse {
  SelfResponse({ required this.id, required this.rank, this.email, this.image, this.name });

  factory SelfResponse.fromJson(Map<String, dynamic> json) => _$SelfResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SelfResponseToJson(this);

  final String id;
  final String? name;
  final String? email;
  final String? image;
  final RankType rank;
}

@JsonSerializable()
class SelfResponseBaseResponse {
  SelfResponseBaseResponse({ required this.message, required this.data });

  factory SelfResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$SelfResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SelfResponseBaseResponseToJson(this);
  
  final String? message;
  final SelfResponse data;
}
