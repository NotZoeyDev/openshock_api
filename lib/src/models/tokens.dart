import 'package:json_annotation/json_annotation.dart';
import 'package:openshock_api/openshock_api.dart';
 
part 'tokens.g.dart';

@JsonSerializable()
class TokenResponse {
  TokenResponse({ required this.id, required this.createdOn, this.name, this.createdByIp, this.permissions, this.validUntil });

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);

  final String id;
  final String? name;
  final DateTime createdOn;
  final String? createdByIp;
  final DateTime? validUntil;
  final List<PermissionType>? permissions;
}

@JsonSerializable()
class TokenResponseBaseResponse {
  TokenResponseBaseResponse({ required this.message, this.data });

  factory TokenResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseBaseResponseToJson(this);
  
  final String? message;
  final TokenResponse? data;
}

@JsonSerializable()
class TokensResponseBaseResponse {
  TokensResponseBaseResponse({ required this.message, this.data });

  factory TokensResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$TokensResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokensResponseBaseResponseToJson(this);
  
  final String? message;
  final List<TokenResponse>? data;
}
