import 'package:intl/intl.dart';

class DateUtils {
  const DateUtils._();

  static String monthDayYear(DateTime date) {
    return DateFormat('MMMM d, y').format(date);
  }

  static String twelveHourTime(DateTime time) {
    return DateFormat('h:mm a').format(time);
  }

  static String twentyFourHourTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  static String shiftDateTime(DateTime date, DateTime time) {
    return '${monthDayYear(date)}, ${twelveHourTime(time)}';
  }

  static String twentyFourHourRange(DateTime start, DateTime finish) {
    return '${twentyFourHourTime(start)}-${twentyFourHourTime(finish)}';
  }

  static String durationInHours(DateTime start, DateTime finish) {
    final Duration duration = _positiveDuration(start, finish);
    final double hours = duration.inMinutes / Duration.minutesPerHour;
    final bool isWholeHour = hours % 1 == 0;
    final String value = isWholeHour
        ? hours.toInt().toString()
        : hours.toStringAsFixed(1);

    return '$value ${hours == 1 ? 'hour' : 'hours'}';
  }

  static Duration _positiveDuration(DateTime start, DateTime finish) {
    final DateTime normalizedFinish = finish.isBefore(start)
        ? finish.add(const Duration(days: 1))
        : finish;

    return normalizedFinish.difference(start);
  }
}
