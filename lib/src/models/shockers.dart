import 'package:json_annotation/json_annotation.dart';
import 'package:openshock_api/openshock_api.dart';
 
part 'shockers.g.dart';

@JsonSerializable()
class ShockerResponse {
  ShockerResponse({ required this.isPaused, required this.createdOn, required this.id, required this.rfId, required this.model, this.name });

  factory ShockerResponse.fromJson(Map<String, dynamic> json) => _$ShockerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShockerResponseToJson(this);

  final String? name;
  final bool isPaused;
  final DateTime createdOn;
  final String id;
  final int rfId;
  final ShockerModelType model;
}

@JsonSerializable()
class ShockerResponseBaseResponse {
  ShockerResponseBaseResponse({ required this.message, this.data });

  factory ShockerResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$ShockerResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShockerResponseBaseResponseToJson(this);
  
  final String? message;
  final List<ShockerResponse>? data;
}

@JsonSerializable()
class ShockerWithDevice extends ShockerResponse {
  ShockerWithDevice({ required super.isPaused, required super.createdOn, required super.id, required super.rfId, required super.model, required this.device, super.name });

  factory ShockerWithDevice.fromJson(Map<String, dynamic> json) => _$ShockerWithDeviceFromJson(json);
  
  @override
  Map<String, dynamic> toJson() => _$ShockerWithDeviceToJson(this);

  final String device;
}

@JsonSerializable()
class ShockerWithDeviceBaseResponse {
  ShockerWithDeviceBaseResponse({ required this.message, this.data });

  factory ShockerWithDeviceBaseResponse.fromJson(Map<String, dynamic> json) => _$ShockerWithDeviceBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShockerWithDeviceBaseResponseToJson(this);
  
  final String? message;
  final ShockerWithDevice? data;
}

@JsonSerializable()
class OwnerShockerResponse {
  OwnerShockerResponse({ required this.id, this.name, this.devices });

  factory OwnerShockerResponse.fromJson(Map<String, dynamic> json) => _$OwnerShockerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerShockerResponseToJson(this);

  final String id;
  final String? name;
  final List<SharedDevice>? devices;
}

@JsonSerializable()
class OwnerShockerResponseBaseResponse {
  OwnerShockerResponseBaseResponse({ required this.message, this.data });

  factory OwnerShockerResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$OwnerShockerResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerShockerResponseBaseResponseToJson(this);
  
  final String? message;
  final List<OwnerShockerResponse>? data;
}

@JsonSerializable()
class ControlLogResponseBaseResponse {
  ControlLogResponseBaseResponse({ required this.message, this.data });

  factory ControlLogResponseBaseResponse.fromJson(Map<String, dynamic> json) => _$ControlLogResponseBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ControlLogResponseBaseResponseToJson(this);
  
  final String? message;
  final List<ControlLogEntry>? data;
}

@JsonSerializable()
class SharedShockerInfoBaseResponse {
  SharedShockerInfoBaseResponse({ required this.message, this.data });

  factory SharedShockerInfoBaseResponse.fromJson(Map<String, dynamic> json) => _$SharedShockerInfoBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SharedShockerInfoBaseResponseToJson(this);
  
  final String? message;
  final List<SharedShockerInfo>? data;
}

@JsonSerializable()
class SharedShockerCodeBaseResponse {
  SharedShockerCodeBaseResponse({ required this.message, this.data });

  factory SharedShockerCodeBaseResponse.fromJson(Map<String, dynamic> json) => _$SharedShockerCodeBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SharedShockerCodeBaseResponseToJson(this);
  
  final String? message;
  final List<SharedShockerCode>? data;
}

@JsonSerializable()
class Shocker {
  Shocker({ required this.rfId, required this.device, required this.model, this.name });

  factory Shocker.fromJson(Map<String, dynamic> json) => _$ShockerFromJson(json);
  Map<String, dynamic> toJson() => _$ShockerToJson(this);

  final String? name;
  final int rfId;
  final String device;
  final ShockerModelType model;
}

@JsonSerializable()
class SharedShocker {
  SharedShocker({ required this.id, required this.isPaused, required this.permissions, required this.limits, this.name});

  factory SharedShocker.fromJson(Map<String, dynamic> json) => _$SharedShockerFromJson(json);
  Map<String, dynamic> toJson() => _$SharedShockerToJson(this);

  final String id;
  final String? name;
  final bool isPaused;
  final ShockerPermissions permissions;
  final ShockerLimits limits;
}

@JsonSerializable()
class SharedShockerInfo {
  SharedShockerInfo({ required this.sharedWidth, required this.createdOn, required this.permissions, required this.limits, required this.paused });

  factory SharedShockerInfo.fromJson(Map<String, dynamic> json) => _$SharedShockerInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SharedShockerInfoToJson(this);

  final ControlUser sharedWidth;
  final DateTime createdOn;
  final ShockerPermissions permissions;
  final ShockerLimits limits;
  final bool paused;
}

@JsonSerializable()
class SharedShockerCode {
  SharedShockerCode({ required this.id, required this.createdOn });

  factory SharedShockerCode.fromJson(Map<String, dynamic> json) => _$SharedShockerCodeFromJson(json);
  Map<String, dynamic> toJson() => _$SharedShockerCodeToJson(this);

  final String id;
  final DateTime createdOn;
}

@JsonSerializable()
class ShockerControl {
  ShockerControl({ required this.id, required this.type, required this.intensity, required this.duration });

  Map<String, dynamic> toJson() => _$ShockerControlToJson(this);

  final String id;
  final ControlType type;
  final int intensity;
  final int duration;
}

@JsonSerializable()
class ShockerPermissions {
  ShockerPermissions({ required this.vibrate, required this.shock, required this.sound, required this.live });

  factory ShockerPermissions.all() => ShockerPermissions(live: true, sound: true, shock: true, vibrate: true);
  factory ShockerPermissions.none() => ShockerPermissions(live: false, sound: false, shock: false, vibrate: false);

  factory ShockerPermissions.fromJson(Map<String, dynamic> json) => _$ShockerPermissionsFromJson(json);
  Map<String, dynamic> toJson() => _$ShockerPermissionsToJson(this);

  final bool vibrate;
  final bool sound;
  final bool shock;
  final bool live; 
}

@JsonSerializable()
class ShockerLimits {
  ShockerLimits({ this.intensity, this.duration });

  factory ShockerLimits.maximum() => ShockerLimits(intensity: 100, duration: 30000);
  factory ShockerLimits.average() => ShockerLimits(intensity: 50, duration: 15000);
  factory ShockerLimits.minimum() => ShockerLimits(intensity: 1, duration: 300);

  factory ShockerLimits.fromJson(Map<String, dynamic> json) => _$ShockerLimitsFromJson(json);
  Map<String, dynamic> toJson() => _$ShockerLimitsToJson(this);

  final int? intensity;
  final int? duration;
}

@JsonSerializable()
class ControlLogEntry {
  ControlLogEntry({ required this.id, required this.createdOn, required this.type, required this.controlledBy, required this.intensity, required this.duration });

  factory ControlLogEntry.fromJson(Map<String, dynamic> json) => _$ControlLogEntryFromJson(json);
  Map<String, dynamic> toJson() => _$ControlLogEntryToJson(this);

  final String id;
  final DateTime createdOn;
  final ControlType type;
  final ControlLogSender controlledBy;
  final int intensity;
  final int duration;
}

@JsonSerializable()
class ControlLogSender extends ControlUser {
  ControlLogSender({ required super.id, this.customName, super.name, super.image });

  factory ControlLogSender.fromJson(Map<String, dynamic> json) => _$ControlLogSenderFromJson(json);
  
  @override
  Map<String, dynamic> toJson() => _$ControlLogSenderToJson(this);

  final String? customName;
}

@JsonSerializable()
class ControlUser {
  ControlUser({ required this.id, this.name, this.image });

  factory ControlUser.fromJson(Map<String, dynamic> json) => _$ControlUserFromJson(json);
  Map<String, dynamic> toJson() => _$ControlUserToJson(this);

  final String id;
  final String? image;
  final String? name;
}
