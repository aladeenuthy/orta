// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      postCode: json['postCode'] as String,
      coordinates: Coordinates.fromJson(
        json['cordinates'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'postCode': instance.postCode,
      'cordinates': instance.coordinates.toJson(),
    };
