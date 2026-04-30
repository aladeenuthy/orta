import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  group('GoogleStaticMapUrl', () {
    test('builds a static map URL with center and marker coordinates', () {
      final Uri uri = Uri.parse(
        GoogleStaticMapUrl.build(
          latitude: 53.4808,
          longitude: -2.2426,
          apiKey: 'test-key',
        ),
      );

      expect(uri.scheme, 'https');
      expect(uri.host, 'maps.googleapis.com');
      expect(uri.path, '/maps/api/staticmap');
      expect(uri.queryParameters['center'], '53.4808,-2.2426');
      expect(uri.queryParameters['markers'], 'color:red|53.4808,-2.2426');
      expect(uri.queryParameters['key'], 'test-key');
    });

    test('returns an empty URL when the API key is missing', () {
      final String url = GoogleStaticMapUrl.build(
        latitude: 53.4808,
        longitude: -2.2426,
        apiKey: '',
      );

      expect(url, isEmpty);
    });
  });
}
