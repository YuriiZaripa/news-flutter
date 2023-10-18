import 'package:intl/intl.dart';

final class DateConverter {
  DateTime convertStringToDateTime(String date) {
    return DateTime.parse(date);
  }

  String getLocaleDate(DateTime dateTime) {
    DateFormat format = DateFormat.yMMMd();
    return format.format(dateTime);
  }
}
