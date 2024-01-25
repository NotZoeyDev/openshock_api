// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfResponse _$SelfResponseFromJson(Map<String, dynamic> json) => SelfResponse(
      id: json['id'] as String,
      rank: $enumDecode(_$RankTypeEnumMap, json['rank']),
      email: json['email'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SelfResponseToJson(SelfResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'rank': _$RankTypeEnumMap[instance.rank]!,
    };

const _$RankTypeEnumMap = {
  RankType.user: 'User',
  RankType.support: 'Support',
  RankType.staff: 'Staff',
  RankType.admin: 'Admin',
  RankType.system: 'System',
};

SelfResponseBaseResponse _$SelfResponseBaseResponseFromJson(
        Map<String, dynamic> json) =>
    SelfResponseBaseResponse(
      message: json['message'] as String?,
      data: SelfResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SelfResponseBaseResponseToJson(
        SelfResponseBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
