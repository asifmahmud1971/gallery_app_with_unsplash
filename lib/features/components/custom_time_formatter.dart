import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_gallery/features/components/custom_progress_loader.dart';
import 'package:unsplash_gallery/features/components/my_context.dart';


class CustomTimeFormatter {
  static String dateRangeFormat(DateTime? dateTime) {
    return DateFormat('dd.MM.yyyy').format(dateTime ?? DateTime.now());

    // something like 10.01.2023
  }

  static String timeRangeFormat(TimeOfDay timeRange) {
    String formattedTime = "${timeRange.hour}:${timeRange.minute}";
    return formattedTime;
    // something like 13:30
  }

  static String dateFormat(DateTime? dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime ?? DateTime.now());

    // something like 2023-10-31
  }

  static String dateTimeFormat(DateTime? dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime ?? DateTime.now());

    // something like 2023-10-31
  }

  static String? utcToLocalDayFormat(DateTime? dateTime) {
    try {
      return DateFormat('dd.MM.yyyy')
          .format((dateTime ?? DateTime.now()).toLocal());
    } on Exception catch (e) {
      dismissProgressDialog();
      return null;
    }
  }

  static String? localDayFormat(DateTime? dateTime) {
    try {
      return DateFormat('yyyy-MM-dd').format((dateTime ?? DateTime.now()));
    } on Exception catch (e) {
      dismissProgressDialog();
      return null;
    }
  }

  static String utcToLocalDayTimeFormat(String? dateTime) {
    DateTime parseTime = DateTime.parse(dateTime.toString()).toLocal();

    return DateFormat('dd.MM.yyyy   HH:mm').format((parseTime));
  }

  static String timeDateFormat(DateTime? dateTime) {
    DateTime? parseTime = dateTime;

    return DateFormat('dd.MM.yyyy HH:mm').format((parseTime ?? DateTime.now()));
  }

  static String utcToLocalTimeFormat(DateTime? dateTime) {
    return DateFormat('HH:mm').format((dateTime ?? DateTime.now()).toLocal());
  }

  static String localToUTCTimeFormat(DateTime? dateTime) {
    return DateFormat('HH:mm').format((dateTime ?? DateTime.now()).toUtc());
  }

  static String localToUTCDayFormat(DateTime? dateTime) {
    return DateFormat('dd.MM.yyyy').format((dateTime ?? DateTime.now()));
  }

  static String utcToLocalFilterDateFormat(DateTime? dateTime) {
    return DateFormat('dd.MM.yyyy   HH:mm')
        .format((dateTime ?? DateTime.now()).toLocal());
  }

  static String time(String dateTime) {
    try {
      DateTime date = DateTime.parse(dateTime);
      final DateFormat formatter =
          DateFormat('Hm', GetContext.context.locale.toString());
      final String formatted = formatter.format(date);
      return formatted;
    } catch (e) {
      return "Running";
    }
    // something like 2013-04-20
  }

  static String hour(String dateTime) {
    try {
      DateTime date = DateTime.parse(dateTime);
      final DateFormat formatter =
          DateFormat('HH', GetContext.context.locale.toString());
      final String formatted = formatter.format(date);
      return formatted;
    } catch (e) {
      return "Running";
    }

    // something like 2013-04-20
  }

  static String timeHMS(String dateTime) {
    try {
      DateTime date = DateTime.parse(dateTime);
      final DateFormat formatter =
          DateFormat('HH:mm:ss', GetContext.context.locale.toString());
      final String formatted = formatter.format(date);
      return formatted;
    } catch (e) {
      return "Running";
    }

    // something like 2013-04-20
  }

  static bool checkTime(
      {String? openTime, String? closedTime, String? startTime}) {
    //NOTE: Time should be as given format only
    //10:00PM
    //10:00AM

    // 01:60PM ->13:60
    //Hrs:Min
    //if AM then its ok but if PM then? 12+time (12+10=22)

    TimeOfDay timeNow = TimeOfDay(
        hour: DateTime.parse(startTime!).hour,
        minute: DateTime.parse(startTime).hour);
    String openHr = openTime!.substring(0, 2);
    String openMin = openTime.substring(3, 5);
    String openAmPm = openTime.substring(5);
    TimeOfDay timeOpen;
    if (openAmPm == "AM") {
      //am case
      if (openHr == "12") {
        //if 12AM then time is 00
        timeOpen = TimeOfDay(hour: 00, minute: int.parse(openMin));
      } else {
        timeOpen =
            TimeOfDay(hour: int.parse(openHr), minute: int.parse(openMin));
      }
    } else {
      //pm case
      if (openHr == "12") {
//if 12PM means as it is
        timeOpen =
            TimeOfDay(hour: int.parse(openHr), minute: int.parse(openMin));
      } else {
//add +12 to conv time to 24hr format
        timeOpen =
            TimeOfDay(hour: int.parse(openHr) + 12, minute: int.parse(openMin));
      }
    }

    String closeHr = closedTime!.substring(0, 2);
    String closeMin = closedTime.substring(3, 5);
    String closeAmPm = closedTime.substring(5);

    TimeOfDay timeClose;

    if (closeAmPm == "AM") {
      //am case
      if (closeHr == "12") {
        timeClose = TimeOfDay(hour: 0, minute: int.parse(closeMin));
      } else {
        timeClose =
            TimeOfDay(hour: int.parse(closeHr), minute: int.parse(closeMin));
      }
    } else {
      //pm case
      if (closeHr == "12") {
        timeClose =
            TimeOfDay(hour: int.parse(closeHr), minute: int.parse(closeMin));
      } else {
        timeClose = TimeOfDay(
            hour: int.parse(closeHr) + 12, minute: int.parse(closeMin));
      }
    }

    int nowInMinutes = timeNow.hour * 60 + timeNow.minute;
    int openTimeInMinutes = timeOpen.hour * 60 + timeOpen.minute;
    int closeTimeInMinutes = timeClose.hour * 60 + timeClose.minute;

//handling day change ie pm to am
    if ((closeTimeInMinutes - openTimeInMinutes) < 0) {
      closeTimeInMinutes = closeTimeInMinutes + 1440;
      if (nowInMinutes >= 0 && nowInMinutes < openTimeInMinutes) {
        nowInMinutes = nowInMinutes + 1440;
      }
      if (openTimeInMinutes < nowInMinutes &&
          nowInMinutes < closeTimeInMinutes) {
        return true;
      }
    } else if (openTimeInMinutes < nowInMinutes &&
        nowInMinutes < closeTimeInMinutes) {
      return true;
    }

    return false;
  }

  static DateTime recentMonday(DateTime dateTime) {
    DateTime mostRecentMonday = DateTime(
        dateTime.year, dateTime.month, dateTime.day - (dateTime.weekday - 1));

    return mostRecentMonday;

    // something like 2013-04-20
  }

  /* bool isTimeBetween(TimeOfDay time, TimeOfDay startTime, TimeOfDay endTime) {
    if (time.compareTo(startTime) >= 0 && time.compareTo(endTime) < 0) {
      return true;
    } else {
      return false;
    }
  }*/

  static bool isCurrentDateInRange(
      {DateTime? startDate, DateTime? endDate, DateTime? selectedDate}) {
    final currentDate = selectedDate;

    if (DateTime(currentDate!.year, currentDate.month, currentDate.day,
                    currentDate.hour, currentDate.minute, currentDate.second)
                .isAfter(DateTime(
                    startDate!.year,
                    startDate.month,
                    startDate.day,
                    startDate.hour,
                    startDate.minute,
                    startDate.second)) &&
            currentDate.isBefore(DateTime(endDate!.year, endDate.month,
                endDate.day, endDate.hour, endDate.minute, endDate.second)) ||
        startDate == selectedDate ||
        endDate == selectedDate) {
      return true;
    } else {
      return false;
    }
  }

  static DateTime recentSunday(DateTime dateTime) {
    DateTime mostRecentSunday = DateTime(
        dateTime.year, dateTime.month, dateTime.day - dateTime.weekday % 7);

    return mostRecentSunday;

    // something like 2013-04-20
  }

  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static DateTime getNextDate(DateTime dateTime) {
    final today = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final yesterday = DateTime(dateTime.year, dateTime.month, dateTime.day - 1);
    final tomorrow = DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
    log("next day : $tomorrow");

    return tomorrow;
  }

  static DateTime getWeekLastDay(DateTime dateTime) {
    int daysOfWeek = dateTime.weekday - 1;
    DateTime firstDay =
        DateTime(dateTime.year, dateTime.month, dateTime.day - daysOfWeek);
    DateTime lastDay = firstDay.add(Duration(days: 6, hours: 23, minutes: 59));

    print(firstDay);
    print(lastDay);

    DateTime nextFirst = firstDay.add(Duration(days: 7));
    DateTime nextLast = lastDay.add(Duration(days: 7));

    print(nextFirst);
    print(nextLast);

    DateTime prevFirst = firstDay.subtract(Duration(days: 7));
    DateTime prevLast = lastDay.subtract(Duration(days: 7));

    print(prevFirst);
    print(prevLast);

    return lastDay;
  }

  static DateTime findNextMonday(DateTime todayDate) {
    DateTime? startDate;

    if (todayDate.weekday == 1) {
      startDate = DateTime.now();
    } else if (todayDate.add(const Duration(days: 1)).weekday == 1) {
      startDate = DateTime.now().add(const Duration(days: 1));
    } else if (todayDate.add(const Duration(days: 2)).weekday == 1) {
      startDate = DateTime.now().add(const Duration(days: 2));
    } else if (todayDate.add(const Duration(days: 3)).weekday == 1) {
      startDate = DateTime.now().add(const Duration(days: 3));
    } else if (todayDate.add(const Duration(days: 4)).weekday == 1) {
      startDate = DateTime.now().add(const Duration(days: 4));
    } else if (todayDate.add(const Duration(days: 5)).weekday == 1) {
      startDate = DateTime.now().add(const Duration(days: 5));
    } else if (todayDate.add(const Duration(days: 6)).weekday == 1) {
      startDate = DateTime.now().add(const Duration(days: 6));
    } else if (todayDate.add(const Duration(days: 7)).weekday == 1) {
      startDate = DateTime.now().add(const Duration(days: 7));
    }
    return (startDate!);
  }

  static String totalIntervalDuration({List? list}) {
    int difference = int.parse(list!
        .fold(
            0,
            (sum, item) => int.parse(sum.toString() +
                CustomTimeFormatter.differenceSecond(
                        item['end_time'], item['start_time'])
                    .toString()))
        .toString());
    Duration duration = Duration(seconds: difference);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    // something like 2013.20.01
  }

  static int getDuration({List? list}) {
    int difference = list!.fold(
        0,
        (previous, current) =>
            previous + int.parse(current['duration'].toString()));

    return difference;
    // something like 2013.20.01
  }

  static int differenceSecond(String endTime, String startTime) {
    Duration duration =
        DateTime.parse(endTime).difference(DateTime.parse(startTime));

    return duration.inSeconds; // something like 2013.20.01
  }

  static String dateTime(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    final String formatted = formatter.format(date);
    return formatted; // something like 23.10.1900
  }

  static String dateTimeWithDay(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    bool isToday = DateTime.parse(dateTime).isToday();
    final DateFormat formatter;
    if (isToday) {
      formatter =
          DateFormat('dd.MM.yyyy', GetContext.context.locale.toString());
      final String formatted = formatter.format(date);
      return "Today, " + formatted;
    } else {
      formatter =
          DateFormat('EEE, dd.MM.yyyy', GetContext.context.locale.toString());
      final String formatted = formatter.format(date);
      return formatted.replaceAll('.,', ',');
    }
  } // something like Wed, 23.10.1990

  static String date(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    final DateFormat formatter =
        DateFormat('dd-MM-yyyy', GetContext.context.locale.toString());
    final String formatted = formatter.format(date);
    return formatted; // something like 2013-04-20
  }

  static String showDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String showDurationTitle(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}h ${twoDigitMinutes}m ${twoDigitSeconds}s";
  }

  static String dateYear(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    final DateFormat formatter =
        DateFormat('MMMM yyyy', GetContext.context.locale.toString());
    final String formatted = formatter.format(date);
    return formatted; // something like 2013-04-20
  }

  static String year(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    final DateFormat formatter =
        DateFormat('yyyy', GetContext.context.locale.toString());
    final String formatted = formatter.format(date);
    return formatted; // something like 2013-04-20
  }

  static String utcTime(String dateTime) {
    return DateFormat(
            "yyyy-MM-dd HH:mm:ss", GetContext.context.locale.toString())
        .format(DateTime.parse(dateTime).toUtc());
    // something like 2013-04-20
  }
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day &&
        now.month == this.month &&
        now.year == this.year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return yesterday.day == this.day &&
        yesterday.month == this.month &&
        yesterday.year == this.year;
  }
}

extension DateTimeExtension on DateTime? {
  bool? isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isAfter(dateTime);
    }
    return null;
  }

  bool? isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isBefore(dateTime);
    }
    return null;
  }

  bool? isBetween(
    DateTime fromDateTime,
    DateTime toDateTime,
  ) {
    final date = this;
    if (date != null) {
      final isAfter = date.isAfterOrEqualTo(fromDateTime) ?? false;
      final isBefore = date.isBeforeOrEqualTo(toDateTime) ?? false;
      return isAfter && isBefore;
    }
    return null;
  }
}
