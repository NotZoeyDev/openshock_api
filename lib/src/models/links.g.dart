// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareLinkResponse _$ShareLinkResponseFromJson(Map<String, dynamic> json) =>
    ShareLinkResponse(
      id: json['id'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      name: json['name'] as String?,
      expiresOn: json['expiresOn'] == null
          ? null
          : DateTime.parse(json['expiresOn'] as String),
    );

Map<String, dynamic> _$ShareLinkResponseToJson(ShareLinkResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdOn': instance.createdOn.toIso8601String(),
      'expiresOn': instance.expiresOn?.toIso8601String(),
    };

ShareLinkResponseBaseResponse _$ShareLinkResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ShareLinkResponseBaseResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ShareLinkResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShareLinkResponseBaseResponseToJson(
        ShareLinkResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ShareLinksResponseBaseResponse _$ShareLinksResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ShareLinksResponseBaseResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ShareLinkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShareLinksResponseBaseResponseToJson(
        ShareLinksResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

PauseReasonBaseResponse _$PauseReasonBaseResponseFromJson(
        Map<String, dynamic> json) =>
    PauseReasonBaseResponse(
      pauseReason: $enumDecode(_$PauseReasonEnumMap, json['pauseReason']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PauseReasonBaseResponseToJson(
        PauseReasonBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'pauseReason': _$PauseReasonEnumMap[instance.pauseReason]!,
    };

const _$PauseReasonEnumMap = {
  PauseReason.none: 'None',
  PauseReason.shocker: 'Shocker',
  PauseReason.share: 'Share',
  PauseReason.shareLink: 'ShareLink',
};
