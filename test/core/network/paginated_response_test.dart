import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  group('PaginatedResponse', () {
    test('parses backend pagination json', () {
      final PaginatedResponse<int> response = PaginatedResponse<int>.fromJson(
        json: <String, dynamic>{
          'data': <int>[1, 2],
          'pagination': <String, dynamic>{
            'currentPage': 2,
            'totalPages': 4,
            'totalCount': 8,
            'hasNextPage': true,
            'hasPrevPage': true,
            'limit': 2,
          },
        },
        fromJson: (dynamic value) => value as int,
        dataKey: 'data',
      );

      expect(response.data, equals(<int>[1, 2]));
      expect(response.currentPage, 2);
      expect(response.totalPages, 4);
      expect(response.totalCount, 8);
      expect(response.hasNextPage, isTrue);
      expect(response.hasPrevPage, isTrue);
      expect(response.limit, 2);
    });
  });
}
