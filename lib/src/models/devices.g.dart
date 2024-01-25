// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceResponse _$DeviceResponseFromJson(Map<String, dynamic> json) =>
    DeviceResponse(
      id: json['id'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeviceResponseToJson(DeviceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdOn': instance.createdOn.toIso8601String(),
    };

DeviceResponseBaseResponse _$DeviceResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    DeviceResponseBaseResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DeviceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeviceResponseBaseResponseToJson(
        DeviceResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

DeviceResponseWithToken _$DeviceResponseWithTokenFromJson(
        Map<String, dynamic> json) =>
    DeviceResponseWithToken(
      token: json['token'] as String,
      id: json['id'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeviceResponseWithTokenToJson(
        DeviceResponseWithToken instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdOn': instance.createdOn.toIso8601String(),
      'token': instance.token,
    };

DeviceResponseWithTokenBaseResponse
    _$DeviceResponseWithTokenBaseResponseFromJson(Map<String, dynamic> json) =>
        DeviceResponseWithTokenBaseResponse(
          message: json['message'] as String?,
          data: json['data'] == null
              ? null
              : DeviceResponseWithToken.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DeviceResponseWithTokenBaseResponseToJson(
        DeviceResponseWithTokenBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

DeviceResponseWithShockers _$DeviceResponseWithShockersFromJson(
        Map<String, dynamic> json) =>
    DeviceResponseWithShockers(
      id: json['id'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      name: json['name'] as String?,
      shockers: (json['shockers'] as List<dynamic>?)
          ?.map((e) => ShockerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeviceResponseWithShockersToJson(
        DeviceResponseWithShockers instance) =>
    <String, dynamic>{
      'shockers': instance.shockers,
      'id': instance.id,
      'name': instance.name,
      'createdOn': instance.createdOn.toIso8601String(),
    };

DeviceResponseWithShockersBaseResponse
    _$DeviceResponseWithShockersBaseResponseFromJson(
            Map<String, dynamic> json) =>
        DeviceResponseWithShockersBaseResponse(
          message: json['message'] as String?,
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => DeviceResponseWithShockers.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$DeviceResponseWithShockersBaseResponseToJson(
        DeviceResponseWithShockersBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

LcgResponse _$LcgResponseFromJson(Map<String, dynamic> json) => LcgResponse(
      gateway: json['gateway'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$LcgResponseToJson(LcgResponse instance) =>
    <String, dynamic>{
      'gateway': instance.gateway,
      'country': instance.country,
    };

LcgResponseBaseResponse _$LcgResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    LcgResponseBaseResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LcgResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LcgResponseBaseResponseToJson(
        LcgResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

SharedDevice _$SharedDeviceFromJson(Map<String, dynamic> json) => SharedDevice(
      id: json['id'] as String,
      name: json['name'] as String?,
      shockers: (json['shockers'] as List<dynamic>?)
          ?.map((e) => SharedShocker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SharedDeviceToJson(SharedDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shockers': instance.shockers,
    };
