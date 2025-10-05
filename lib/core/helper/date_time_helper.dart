import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateTimeFromString(
      {required String dateTimeString, required String formar}) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat(formar, 'id').format(dateTime);
  }

  static String formatDateTime(
      {required DateTime dateTime, required String format}) {
    return DateFormat(format, 'id').format(dateTime);
  }

  static Duration getDifference({required DateTime a, required DateTime b}) {
    return b.difference(a);
  }

  static DateTime parseDateTime(
      {required String dateTimeString, String format = 'd MMM yyyy'}) {
    return DateFormat(format).parse(dateTimeString);
  }
}
