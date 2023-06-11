import 'package:bettertogether/Models/Base.dart';
import 'package:bettertogether/Models/DayMark.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

import 'User.dart';

@Entity()
class Habit extends Base {
  Habit() {
    color = Colors.blue;
    dateOfCreation = DateTime.now();
  }

  @Id()
  int id = 0;

  String? name;

  String? description;

  DateTime? dateOfCreation;

  DateTime? startTime;

  DateTime? endTime;

  List<bool>? daysOfWeek = [];

  bool? monday = true;
  bool? tuesday = true;
  bool? wednesday = true;
  bool? thursday = true;
  bool? friday = true;
  bool? saturday = true;
  bool? sunday = true;
  bool? daysPerWeek = true;

  List<DateTime>? doneDays = [];

  List<DateTime>? missedDays = [];

  Color? color;

  int? currentScore;

  final user = ToOne<User>();

  @Backlink('habit')
  final dayMarks = ToMany<DayMark>();

  void setDaysOfWeek(List<bool> daysOfWeek) {
    for (int i = 0; i < 7; i++) {
      if (i == 0) {
        sunday = daysOfWeek[i];
      }
      if (i == 1) {
        monday = daysOfWeek[i];
      }
      if (i == 2) {
        tuesday = daysOfWeek[i];
      }
      if (i == 3) {
        wednesday = daysOfWeek[i];
      }
      if (i == 4) {
        thursday = daysOfWeek[i];
      }
      if (i == 5) {
        friday = daysOfWeek[i];
      }
      if (i == 6) {
        saturday = daysOfWeek[i];
      }
    }
  }

  List<bool> getDates() {
    daysOfWeek = List<bool>.filled(7, true);
    for (int i = 0; i < 7; i++) {
      if (i == 0) {
        daysOfWeek![i] = sunday!;
      }
      if (i == 1) {
        daysOfWeek![i] = monday!;
      }
      if (i == 2) {
        daysOfWeek![i] = tuesday!;
      }
      if (i == 3) {
        daysOfWeek![i] = wednesday!;
      }
      if (i == 4) {
        daysOfWeek![i] = thursday!;
      }
      if (i == 5) {
        daysOfWeek![i] = friday!;
      }
      if (i == 6) {
        daysOfWeek![i] = saturday!;
      }
    }

    return daysOfWeek!;
  }

  bool isDaySelected(int day) {
    if (day == 0) {
      return monday!;
    }
    if (day == 1) {
      return tuesday!;
    }
    if (day == 2) {
      return wednesday!;
    }
    if (day == 3) {
      return thursday!;
    }
    if (day == 4) {
      return friday!;
    }
    if (day == 5) {
      return saturday!;
    }
    if (day == 6) {
      return sunday!;
    }
    return false;
  }

  void recalculateHabit() {
    for (DateTime i = dateOfCreation!;
        i.compareTo(DateTime.now()) >= 0;
        i.add(Duration(days: 1))) {
      if (isDaySelected(i.weekday - 1) &&
          doneDays!.firstWhere(
                  (element) =>
                      element.day == i.day &&
                      element.year == element.year &&
                      element.month == element.month,
                  orElse: () => DateTime.utc(1990, 01, 01)) ==
              DateTime.utc(1990, 01, 01)) {
        missedDays!.add(i);
        currentScore = 0;
        continue;
      }

      if (isDaySelected(i.weekday - 1) &&
          doneDays!.firstWhere(
                  (element) =>
                      element.day == i.day &&
                      element.year == element.year &&
                      element.month == element.month,
                  orElse: () => DateTime.utc(1990, 01, 01)) !=
              DateTime.utc(1990, 01, 01)) {
        doneDays!.add(i);
        currentScore = currentScore! + 1;
        continue;
      }
    }
  }

  bool isDoneForDay(DateTime dateTime) {

    if (isDayMarkExists(dateTime)) {
      return dayMarks
          .firstWhere((element) =>
              element.date.year == dateTime.year &&
              element.date.month == dateTime.month &&
              element.date.day == dateTime.day)
          .isDone!;
    } else {
      return false;
    }
  }

  void changeDoneForDay(DateTime dateTime) {

    if (isDayMarkExists(dateTime)) {
      dayMarks
              .firstWhere((element) =>
                  element.date.year == dateTime.year &&
                  element.date.month == dateTime.month &&
                  element.date.day == dateTime.day)
              .isDone =
          !dayMarks
              .firstWhere((element) =>
                  element.date.year == dateTime.year &&
                  element.date.month == dateTime.month &&
                  element.date.day == dateTime.day)
              .isDone!;
    }
  }

  bool isDayMarkExists(DateTime dateTime) {
    DayMark unrealDayMark = DayMark(DateTime.utc(1900));

    if (dayMarks
            .firstWhere(
                (element) =>
                    element.date.year == dateTime.year &&
                    element.date.month == dateTime.month &&
                    element.date.day == dateTime.day,
                orElse: () => unrealDayMark)
            .date
            .year !=
        DateTime.utc(1900).year) {
      return true;
    } else {
      return false;
    }
  }
}
