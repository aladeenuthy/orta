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
      final List<dynamic> schedule = body['weeklySchedule'] as List<dynamic>;

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

  Future<Either<AppError, Unit>> saveAvailability({
    required List<AvailabilityDay> weeklySchedule,
  }) {
    return makeRequest(() async {
      await post(
        Endpoints.profileAvailability,
        data: <String, dynamic>{
          'weeklySchedule': weeklySchedule
              .map((AvailabilityDay day) => day.toJson())
              .toList(),
        },
      );

      return right<AppError, Unit>(unit);
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
      final List<dynamic> items =
          (body['data'] ?? body['unavailableDates']) as List<dynamic>;

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

  Future<Either<AppError, Unit>> saveUnavailability({
    required List<UnavailabilityPeriod> unavailableDates,
  }) {
    return makeRequest(() async {
      await post(
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

      return right<AppError, Unit>(unit);
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
}
