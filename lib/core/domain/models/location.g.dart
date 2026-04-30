// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      postCode: json['postCode'] as String?,
      distance: json['distance'] as num?,
      constituency: json['constituency'] as String?,
      adminDistrict: json['adminDistrict'] as String?,
      address: json['address'] as String?,
      coordinates: Coordinates.fromJson(
        _readCoordinates(json, 'coordinates') as Map<String, dynamic>,
      ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'postCode': instance.postCode,
      'distance': instance.distance,
      'constituency': instance.constituency,
      'adminDistrict': instance.adminDistrict,
      'address': instance.address,
      'coordinates': instance.coordinates.toJson(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
