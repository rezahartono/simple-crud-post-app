// ignore_for_file: unnecessary_new

import 'package:intl/intl.dart';

class DateTimeUtil {
  String getFormattedDate({
    required String date,
    required DateFormat format,
  }) {
    DateTime newDate = DateTime.parse(date);

    return format.format(newDate);
  }

  String now({
    DateFormat? format,
  }) {
    DateTime date = DateTime.now();

    if (format != null) {
      return format.format(date);
    } else {
      return date.toIso8601String();
    }
  }
}

DateTimeUtil dateTimeUtil = new DateTimeUtil();
