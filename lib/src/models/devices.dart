import 'package:json_annotation/json_annotation.dart';
import 'package:openshock_api/openshock_api.dart';
 
part 'devices.g.dart';

@JsonSerializable()
class DeviceResponse {
  DeviceResponse({ required this.id, required this.createdOn, this.name });

  factory DeviceResponse.fromJson(Map<String, dynamic> json) => _$DeviceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceResponseToJson(this);

  final String id;
  final String? name;
  final DateTime createdOn;
}

@JsonSerializable()
class DeviceResponseBaseResponse {
  DeviceResponseBaseResponse({ required this.message, this.data });

  factory DeviceResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$DeviceResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceResponseBaseResponseToJson(this);
  
  final String? message;
  final List<DeviceResponse>? data;
}

@JsonSerializable()
class DeviceResponseWithToken extends DeviceResponse {
  DeviceResponseWithToken({ required this.token, required super.id, required super.createdOn, super.name });

  factory DeviceResponseWithToken.fromJson(Map<String, dynamic> json) => _$DeviceResponseWithTokenFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeviceResponseWithTokenToJson(this);

  final String token;
}

@JsonSerializable()
class DeviceResponseWithTokenBaseResponse {
  DeviceResponseWithTokenBaseResponse({ required this.message, this.data });

  factory DeviceResponseWithTokenBaseResponse.fromJson(Map<String, dynamic> json) => _$DeviceResponseWithTokenBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceResponseWithTokenBaseResponseToJson(this);
  
  final String? message;
  final DeviceResponseWithToken? data;
}

@JsonSerializable()
class DeviceResponseWithShockers {
  DeviceResponseWithShockers({ required this.id, required this.createdOn, this.name, this.shockers });

  factory DeviceResponseWithShockers.fromJson(Map<String, dynamic> json) => _$DeviceResponseWithShockersFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceResponseWithShockersToJson(this);

  final List<ShockerResponse>? shockers;
  final String id;
  final String? name;
  final DateTime createdOn;
}

@JsonSerializable()
class DeviceResponseWithShockersBaseResponse {
  DeviceResponseWithShockersBaseResponse({ required this.message, this.data });

  factory DeviceResponseWithShockersBaseResponse.fromJson(Map<String, dynamic> json) => _$DeviceResponseWithShockersBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceResponseWithShockersBaseResponseToJson(this);
  
  final String? message;
  final List<DeviceResponseWithShockers>? data;
}

@JsonSerializable()
class LcgResponse {
  LcgResponse({ this.gateway, this.country });

  factory LcgResponse.fromJson(Map<String, dynamic> json) => _$LcgResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LcgResponseToJson(this);

  final String? gateway;
  final String? country;
}

@JsonSerializable()
class LcgResponseBaseResponse {
  LcgResponseBaseResponse({ required this.message, this.data });

  factory LcgResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$LcgResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LcgResponseBaseResponseToJson(this);
  
  final String? message;
  final LcgResponse? data;
}

@JsonSerializable()
class SharedDevice {
  SharedDevice({ required this.id, this.name, this.shockers });

  factory SharedDevice.fromJson(Map<String, dynamic> json) => _$SharedDeviceFromJson(json);
  Map<String, dynamic> toJson() => _$SharedDeviceToJson(this);

  final String id;
  final String? name;
  final List<SharedShocker>? shockers;
}
