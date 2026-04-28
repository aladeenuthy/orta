// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkerProfileImpl _$$WorkerProfileImplFromJson(Map<String, dynamic> json) =>
    _$WorkerProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      jobRole: json['jobRole'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      profilePictureUrl: json['profilePictureUrl'] as String?,
      isProfileComplete: json['isProfileComplete'] as bool? ?? false,
    );

Map<String, dynamic> _$$WorkerProfileImplToJson(_$WorkerProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'city': instance.city,
      'jobRole': instance.jobRole,
      'skills': instance.skills,
      'profilePictureUrl': instance.profilePictureUrl,
      'isProfileComplete': instance.isProfileComplete,
    };
