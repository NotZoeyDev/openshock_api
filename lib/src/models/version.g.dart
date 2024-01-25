// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionResponse _$VersionResponseFromJson(Map<String, dynamic> json) =>
    VersionResponse(
      currentTime: DateTime.parse(json['currentTime'] as String),
      commit: json['commit'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$VersionResponseToJson(VersionResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'commit': instance.commit,
      'currentTime': instance.currentTime.toIso8601String(),
    };

VersionResponseBaseResponse _$VersionResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    VersionResponseBaseResponse(
      message: json['message'] as String?,
      data: VersionResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionResponseBaseResponseToJson(
        VersionResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
