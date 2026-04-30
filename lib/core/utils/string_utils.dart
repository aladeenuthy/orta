class StringUtils {
  const StringUtils._();

  static String initials(String? value, {String fallback = 'AA'}) {
    final List<String> parts = (value ?? '')
        .trim()
        .split(RegExp(r'\s+'))
        .where((String part) => part.isNotEmpty)
        .toList();

    if (parts.isEmpty) return fallback;

    final String first = parts.first[0];
    final String second = parts.length > 1 ? parts[1][0] : '';

    return '$first$second'.toUpperCase();
  }
}
