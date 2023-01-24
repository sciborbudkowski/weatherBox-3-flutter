import 'dart:ffi';

import 'package:intl/intl.dart';

extension TimeOperations on int {
  String toHourAndMinutes() {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(this * 1000);

    var hour = dt.hour.toString();
    if (dt.hour < 10) {
      hour = '0$hour';
    }

    var minute = dt.minute.toString();
    if (dt.minute < 10) {
      minute = '0$minute';
    }

    return '$hour:$minute';
  }

  String toWeekdayName() {
    var date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    var dayName = DateFormat('EEEE').format(date);

    return dayName;
  }

  String toMonthAndDay() {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    var day = dt.day.toString();
    if (dt.day < 10) {
      day = '0$day';
    }

    var month = dt.month.toString();
    if (dt.month < 10) {
      month = '0$month';
    }

    return '$day.$month';
  }
}
