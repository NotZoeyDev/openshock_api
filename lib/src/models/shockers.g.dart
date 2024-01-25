// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shockers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShockerResponse _$ShockerResponseFromJson(Map<String, dynamic> json) =>
    ShockerResponse(
      isPaused: json['isPaused'] as bool,
      createdOn: DateTime.parse(json['createdOn'] as String),
      id: json['id'] as String,
      rfId: json['rfId'] as int,
      model: $enumDecode(_$ShockerModelTypeEnumMap, json['model']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ShockerResponseToJson(ShockerResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isPaused': instance.isPaused,
      'createdOn': instance.createdOn.toIso8601String(),
      'id': instance.id,
      'rfId': instance.rfId,
      'model': _$ShockerModelTypeEnumMap[instance.model]!,
    };

const _$ShockerModelTypeEnumMap = {
  ShockerModelType.caixianlin: 'CaiXianlin',
  ShockerModelType.petrainer: 'PetTrainer',
};

ShockerResponseBaseResponse _$ShockerResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ShockerResponseBaseResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ShockerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShockerResponseBaseResponseToJson(
        ShockerResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ShockerWithDevice _$ShockerWithDeviceFromJson(Map<String, dynamic> json) =>
    ShockerWithDevice(
      isPaused: json['isPaused'] as bool,
      createdOn: DateTime.parse(json['createdOn'] as String),
      id: json['id'] as String,
      rfId: json['rfId'] as int,
      model: $enumDecode(_$ShockerModelTypeEnumMap, json['model']),
      device: json['device'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ShockerWithDeviceToJson(ShockerWithDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isPaused': instance.isPaused,
      'createdOn': instance.createdOn.toIso8601String(),
      'id': instance.id,
      'rfId': instance.rfId,
      'model': _$ShockerModelTypeEnumMap[instance.model]!,
      'device': instance.device,
    };

ShockerWithDeviceBaseResponse _$ShockerWithDeviceBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ShockerWithDeviceBaseResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ShockerWithDevice.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShockerWithDeviceBaseResponseToJson(
        ShockerWithDeviceBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

OwnerShockerResponse _$OwnerShockerResponseFromJson(
        Map<String, dynamic> json) =>
    OwnerShockerResponse(
      id: json['id'] as String,
      name: json['name'] as String?,
      devices: (json['devices'] as List<dynamic>?)
          ?.map((e) => SharedDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OwnerShockerResponseToJson(
        OwnerShockerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'devices': instance.devices,
    };

OwnerShockerResponseBaseResponse _$OwnerShockerResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    OwnerShockerResponseBaseResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OwnerShockerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OwnerShockerResponseBaseResponseToJson(
        OwnerShockerResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ControlLogResponseBaseResponse _$ControlLogResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ControlLogResponseBaseResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ControlLogEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ControlLogResponseBaseResponseToJson(
        ControlLogResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

SharedShockerInfoBaseResponse _$SharedShockerInfoBaseResponseFromJson(
        Map<String, dynamic> json) =>
    SharedShockerInfoBaseResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SharedShockerInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SharedShockerInfoBaseResponseToJson(
        SharedShockerInfoBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

SharedShockerCodeBaseResponse _$SharedShockerCodeBaseResponseFromJson(
        Map<String, dynamic> json) =>
    SharedShockerCodeBaseResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SharedShockerCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SharedShockerCodeBaseResponseToJson(
        SharedShockerCodeBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Shocker _$ShockerFromJson(Map<String, dynamic> json) => Shocker(
      rfId: json['rfId'] as int,
      device: json['device'] as String,
      model: $enumDecode(_$ShockerModelTypeEnumMap, json['model']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ShockerToJson(Shocker instance) => <String, dynamic>{
      'name': instance.name,
      'rfId': instance.rfId,
      'device': instance.device,
      'model': _$ShockerModelTypeEnumMap[instance.model]!,
    };

SharedShocker _$SharedShockerFromJson(Map<String, dynamic> json) =>
    SharedShocker(
      id: json['id'] as String,
      isPaused: json['isPaused'] as bool,
      permissions: ShockerPermissions.fromJson(
          json['permissions'] as Map<String, dynamic>),
      limits: ShockerLimits.fromJson(json['limits'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SharedShockerToJson(SharedShocker instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isPaused': instance.isPaused,
      'permissions': instance.permissions,
      'limits': instance.limits,
    };

SharedShockerInfo _$SharedShockerInfoFromJson(Map<String, dynamic> json) =>
    SharedShockerInfo(
      sharedWidth:
          ControlUser.fromJson(json['sharedWidth'] as Map<String, dynamic>),
      createdOn: DateTime.parse(json['createdOn'] as String),
      permissions: ShockerPermissions.fromJson(
          json['permissions'] as Map<String, dynamic>),
      limits: ShockerLimits.fromJson(json['limits'] as Map<String, dynamic>),
      paused: json['paused'] as bool,
    );

Map<String, dynamic> _$SharedShockerInfoToJson(SharedShockerInfo instance) =>
    <String, dynamic>{
      'sharedWidth': instance.sharedWidth,
      'createdOn': instance.createdOn.toIso8601String(),
      'permissions': instance.permissions,
      'limits': instance.limits,
      'paused': instance.paused,
    };

SharedShockerCode _$SharedShockerCodeFromJson(Map<String, dynamic> json) =>
    SharedShockerCode(
      id: json['id'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
    );

Map<String, dynamic> _$SharedShockerCodeToJson(SharedShockerCode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdOn': instance.createdOn.toIso8601String(),
    };

ShockerControl _$ShockerControlFromJson(Map<String, dynamic> json) =>
    ShockerControl(
      id: json['id'] as String,
      type: $enumDecode(_$ControlTypeEnumMap, json['type']),
      intensity: json['intensity'] as int,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$ShockerControlToJson(ShockerControl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ControlTypeEnumMap[instance.type]!,
      'intensity': instance.intensity,
      'duration': instance.duration,
    };

const _$ControlTypeEnumMap = {
  ControlType.stop: 'Stop',
  ControlType.shock: 'Shock',
  ControlType.vibrate: 'Vibrate',
  ControlType.sound: 'Sound',
};

ShockerPermissions _$ShockerPermissionsFromJson(Map<String, dynamic> json) =>
    ShockerPermissions(
      vibrate: json['vibrate'] as bool,
      shock: json['shock'] as bool,
      sound: json['sound'] as bool,
      live: json['live'] as bool,
    );

Map<String, dynamic> _$ShockerPermissionsToJson(ShockerPermissions instance) =>
    <String, dynamic>{
      'vibrate': instance.vibrate,
      'sound': instance.sound,
      'shock': instance.shock,
      'live': instance.live,
    };

ShockerLimits _$ShockerLimitsFromJson(Map<String, dynamic> json) =>
    ShockerLimits(
      intensity: json['intensity'] as int?,
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$ShockerLimitsToJson(ShockerLimits instance) =>
    <String, dynamic>{
      'intensity': instance.intensity,
      'duration': instance.duration,
    };

ControlLogEntry _$ControlLogEntryFromJson(Map<String, dynamic> json) =>
    ControlLogEntry(
      id: json['id'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      type: $enumDecode(_$ControlTypeEnumMap, json['type']),
      controlledBy: ControlLogSender.fromJson(
          json['controlledBy'] as Map<String, dynamic>),
      intensity: json['intensity'] as int,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$ControlLogEntryToJson(ControlLogEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdOn': instance.createdOn.toIso8601String(),
      'type': _$ControlTypeEnumMap[instance.type]!,
      'controlledBy': instance.controlledBy,
      'intensity': instance.intensity,
      'duration': instance.duration,
    };

ControlLogSender _$ControlLogSenderFromJson(Map<String, dynamic> json) =>
    ControlLogSender(
      id: json['id'] as String,
      customName: json['customName'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ControlLogSenderToJson(ControlLogSender instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'customName': instance.customName,
    };

ControlUser _$ControlUserFromJson(Map<String, dynamic> json) => ControlUser(
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ControlUserToJson(ControlUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
    };
