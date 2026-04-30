import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ProfileRemoteDataSource extends BaseAppRepository {
  ProfileRemoteDataSource({required super.api});

  Future<Either<AppError, Profile>> getProfile() {
    return makeRequest(() async {
      final response = await get(Endpoints.profile);
      final Map<String, dynamic> body = Map<String, dynamic>.from(
        response.data as Map,
      );

      return right<AppError, Profile>(Profile.fromJson(_readProfileJson(body)));
    });
  }

  Future<Either<AppError, Profile>> updateProfile({
    String? name,
    String? phone,
    String? city,
    String? jobRole,
    List<String>? skills,
    String? profilePictureUrl,
  }) {
    return makeRequest(() async {
      final response = await patch(
        Endpoints.profile,
        data: <String, dynamic>{
          if (name != null) 'name': name,
          if (phone != null) 'phone': phone,
          if (city != null) 'city': city,
          if (jobRole != null) 'jobRole': jobRole,
          if (skills != null) 'skills': skills,
          if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
        },
      );
      final Map<String, dynamic> body = Map<String, dynamic>.from(
        response.data as Map,
      );

      return right<AppError, Profile>(Profile.fromJson(_readProfileJson(body)));
    });
  }

  Future<Either<AppError, List<AvailabilityDay>>> getAvailability() {
    return makeRequest(() async {
      final response = await get(Endpoints.profileAvailability);
      final Map<String, dynamic> body = Map<String, dynamic>.from(
        response.data as Map,
      );
      final List<dynamic> schedule = _readAvailabilityJson(body);

      return right<AppError, List<AvailabilityDay>>(
        schedule
            .map(
              (dynamic json) => AvailabilityDay.fromJson(
                Map<String, dynamic>.from(json as Map),
              ),
            )
            .toList(),
      );
    });
  }

  Future<Either<AppError, List<AvailabilityDay>>> saveAvailability({
    required List<AvailabilityDay> weeklySchedule,
  }) {
    return makeRequest(() async {
      final response = await post(
        Endpoints.profileAvailability,
        data: <String, dynamic>{
          'weeklySchedule': weeklySchedule
              .map(_availabilityDayPayload)
              .toList(),
        },
      );
      final Map<String, dynamic> body = Map<String, dynamic>.from(
        response.data as Map,
      );
      final List<dynamic> schedule = _readAvailabilityJson(body);
      final List<AvailabilityDay> updatedSchedule = schedule.isEmpty
          ? weeklySchedule
          : schedule
                .map(
                  (dynamic json) => AvailabilityDay.fromJson(
                    Map<String, dynamic>.from(json as Map),
                  ),
                )
                .toList();

      return right<AppError, List<AvailabilityDay>>(updatedSchedule);
    });
  }

  Future<Either<AppError, List<UnavailabilityPeriod>>> getUnavailability({
    String? month,
  }) {
    return makeRequest(() async {
      final response = await get(
        Endpoints.profileUnavailability,
        queryParameters: <String, dynamic>{if (month != null) 'month': month},
      );
      final Map<String, dynamic> body = Map<String, dynamic>.from(
        response.data as Map,
      );
      final List<dynamic> items = _readUnavailabilityJson(body);

      return right<AppError, List<UnavailabilityPeriod>>(
        items
            .map(
              (dynamic json) => UnavailabilityPeriod.fromJson(
                Map<String, dynamic>.from(json as Map),
              ),
            )
            .toList(),
      );
    });
  }

  Future<Either<AppError, List<UnavailabilityPeriod>>> saveUnavailability({
    required List<UnavailabilityPeriod> unavailableDates,
  }) {
    return makeRequest(() async {
      final response = await post(
        Endpoints.profileUnavailability,
        data: <String, dynamic>{
          'unavailableDates': unavailableDates
              .map(
                (UnavailabilityPeriod item) => <String, dynamic>{
                  'startDate': DateUtils.dateOnly(item.startDate),
                  'endDate': DateUtils.dateOnly(item.endDate),
                  if (item.reason != null) 'reason': item.reason,
                },
              )
              .toList(),
        },
      );
      final Map<String, dynamic> body = Map<String, dynamic>.from(
        response.data as Map,
      );
      final List<dynamic> items = _readUnavailabilityJson(body);
      final List<UnavailabilityPeriod> updatedItems = items.isEmpty
          ? unavailableDates
          : items
                .map(
                  (dynamic json) => UnavailabilityPeriod.fromJson(
                    Map<String, dynamic>.from(json as Map),
                  ),
                )
                .toList();

      return right<AppError, List<UnavailabilityPeriod>>(updatedItems);
    });
  }

  Future<Either<AppError, Unit>> deleteUnavailability(String id) {
    return makeRequest(() async {
      await delete(Endpoints.deleteProfileUnavailability(id));

      return right<AppError, Unit>(unit);
    });
  }

  Map<String, dynamic> _readProfileJson(Map<String, dynamic> body) {
    final Object? data = body['data'] ?? body['profile'] ?? body['user'];
    if (data is Map) {
      final Map<String, dynamic> json = Map<String, dynamic>.from(data);
      final Object? nestedProfile = json['profile'];
      if (nestedProfile is Map) {
        return Map<String, dynamic>.from(nestedProfile);
      }
      return json;
    }

    return body;
  }

  List<dynamic> _readAvailabilityJson(Map<String, dynamic> body) {
    final Object? data = body['data'];
    if (data is List) return data;
    if (data is Map) {
      final Object? schedule = data['weeklySchedule'] ?? data['availability'];
      if (schedule is List) return schedule;
    }

    final Object? schedule = body['weeklySchedule'] ?? body['availability'];
    if (schedule is List) return schedule;

    return const <dynamic>[];
  }

  List<dynamic> _readUnavailabilityJson(Map<String, dynamic> body) {
    final Object? data = body['data'];
    if (data is Map) {
      final Object? items = data['unavailableDates'] ?? data['items'];
      if (items is List) return items;
    }
    if (data is List) return data;

    final Object? items = body['unavailableDates'] ?? body['items'];
    if (items is List) return items;

    return const <dynamic>[];
  }

  Map<String, dynamic> _availabilityDayPayload(AvailabilityDay day) {
    return <String, dynamic>{
      'day': day.day,
      'isAvailable': day.isAvailable,
      if (day.isAvailable) 'startTime': day.startTime,
      if (day.isAvailable) 'endTime': day.endTime,
    };
  }
}
