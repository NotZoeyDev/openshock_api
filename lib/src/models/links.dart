import 'package:json_annotation/json_annotation.dart';
import 'package:openshock_api/openshock_api.dart';
 
part 'links.g.dart';

@JsonSerializable()
class ShareLinkResponse {
  ShareLinkResponse({ required this.id, required this.createdOn, this.name, this.expiresOn });

  factory ShareLinkResponse.fromJson(Map<String, dynamic> json) => _$ShareLinkResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShareLinkResponseToJson(this);

  final String id;
  final String? name;
  final DateTime createdOn;
  final DateTime? expiresOn;
}

@JsonSerializable()
class ShareLinkResponseBaseResponse {
  ShareLinkResponseBaseResponse({ required this.message, this.data });

  factory ShareLinkResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$ShareLinkResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShareLinkResponseBaseResponseToJson(this);
  
  final String? message;
  final ShareLinkResponse? data;
}

@JsonSerializable()
class ShareLinksResponseBaseResponse {
  ShareLinksResponseBaseResponse({ required this.message, this.data });

  factory ShareLinksResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$ShareLinksResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShareLinksResponseBaseResponseToJson(this);
  
  final String? message;
  final List<ShareLinkResponse>? data;
}

@JsonSerializable()
class PauseReasonBaseResponse {
  PauseReasonBaseResponse({ required this.pauseReason, this.message });

  factory PauseReasonBaseResponse.fromJson(Map<String, dynamic> json) => _$PauseReasonBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PauseReasonBaseResponseToJson(this);

  final String? message;
  final PauseReason pauseReason;
}
