// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      id: json['id'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      name: json['name'] as String?,
      createdByIp: json['createdByIp'] as String?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PermissionTypeEnumMap, e))
          .toList(),
      validUntil: json['validUntil'] == null
          ? null
          : DateTime.parse(json['validUntil'] as String),
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdOn': instance.createdOn.toIso8601String(),
      'createdByIp': instance.createdByIp,
      'validUntil': instance.validUntil?.toIso8601String(),
      'permissions': instance.permissions
          ?.map((e) => _$PermissionTypeEnumMap[e]!)
          .toList(),
    };

const _$PermissionTypeEnumMap = {
  PermissionType.shockersUser: 'shockersUser',
};

TokenResponseBaseResponse _$TokenResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    TokenResponseBaseResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TokenResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenResponseBaseResponseToJson(
        TokenResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

TokensResponseBaseResponse _$TokensResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    TokensResponseBaseResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TokenResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TokensResponseBaseResponseToJson(
        TokensResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
