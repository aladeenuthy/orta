// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  @JsonSerializable(explicitToJson: true)
  const factory Location({
    required String id,
    required String name,
    String? postCode,
    num? distance,
    String? constituency,
    String? adminDistrict,
    String? address,
    @JsonKey(name: 'coordinates', readValue: _readCoordinates)
    required Coordinates coordinates,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

Object? _readCoordinates(Map<dynamic, dynamic> json, String key) {
  return json['coordinates'] ?? json['cordinates'];
}
