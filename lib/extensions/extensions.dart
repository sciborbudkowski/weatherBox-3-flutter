import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

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

  String toWeekdayName(BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    var date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    initializeDateFormatting(locale);
    var dayName = DateFormat.EEEE(locale).format(date);

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

class UrlParser {
  static Future<void> loadUrl(String urlToParse) async {
    var url = Uri.parse(urlToParse);
    var isUrlLaunchable = await url_launcher.canLaunchUrl(url);

    if (isUrlLaunchable) {
      await url_launcher.launchUrl(url);
    } else {
      print('Can not launch $urlToParse');
    }
  }
}
