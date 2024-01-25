// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectBaseResponse _$ObjectBaseResponseFromJson(Map<String, dynamic> json) =>
    ObjectBaseResponse(
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$ObjectBaseResponseToJson(ObjectBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

GuidBaseResponse _$GuidBaseResponseFromJson(Map<String, dynamic> json) =>
    GuidBaseResponse(
      data: json['data'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GuidBaseResponseToJson(GuidBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

StringBaseResponse _$StringBaseResponseFromJson(Map<String, dynamic> json) =>
    StringBaseResponse(
      data: json['data'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StringBaseResponseToJson(StringBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

BooleanBaseResponse _$BooleanBaseResponseFromJson(Map<String, dynamic> json) =>
    BooleanBaseResponse(
      data: json['data'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BooleanBaseResponseToJson(
        BooleanBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
