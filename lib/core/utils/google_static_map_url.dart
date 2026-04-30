class GoogleStaticMapUrl {
  const GoogleStaticMapUrl._();

  static String build({
    required double latitude,
    required double longitude,
    required String apiKey,
    int zoom = 28,
    String size = '640x300',
  }) {
    if (apiKey.isEmpty) {
      return '';
    }

    final String coordinate = '$latitude,$longitude';

    return Uri.https(
      'maps.googleapis.com',
      '/maps/api/staticmap',
      <String, String>{
        'center': coordinate,
        'zoom': zoom.toString(),
        'size': size,
        'scale': '2',
        'maptype': 'roadmap',
        'markers': 'color:red|$coordinate',
        'key': apiKey,
      },
    ).toString();
  }
}
