import 'package:orta/features/features.dart';

Map<String, dynamic> shiftJson({String id = 'shift-id'}) {
  return <String, dynamic>{
    'id': id,
    'title': 'Morning Care',
    'role': 'Care Worker',
    'typeOfShift': <String>['weekend'],
    'user': '69edb6a277d24da71a004b3e',
    'startTime': '2026-04-26T00:44:00.000Z',
    'finishTime': '2026-04-26T04:17:00.000Z',
    'numOfShiftsPerDay': 1,
    'location': <String, dynamic>{
      'id': 'location-id',
      'name': 'Main Office',
      'address': '12 Worker Street',
      'postCode': 'SW1A 1AA',
      'cordinates': <String, dynamic>{
        'longitude': 180,
        'latitude': 90,
        'useRotaCloud': true,
      },
    },
    'date': '2026-04-26T08:10:36.309Z',
    'status': 'In Progress',
  };
}

Shift shiftModel({String id = 'shift-id'}) {
  return Shift.fromJson(shiftJson(id: id));
}

Map<String, dynamic> paginatedShiftsJson({
  List<Map<String, dynamic>>? shifts,
  int currentPage = 1,
  int totalPages = 1,
  int totalCount = 1,
  bool hasNextPage = false,
  bool hasPrevPage = false,
  int limit = 10,
}) {
  return <String, dynamic>{
    'shifts': shifts ?? <Map<String, dynamic>>[shiftJson()],
    'pagination': <String, dynamic>{
      'currentPage': currentPage,
      'totalPages': totalPages,
      'totalCount': totalCount,
      'hasNextPage': hasNextPage,
      'hasPrevPage': hasPrevPage,
      'limit': limit,
    },
  };
}
