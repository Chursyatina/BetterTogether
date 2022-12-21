import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'current_habit_sttore.g.dart';

class CurrentHabitStore = _CurrentHabitStoreBase with _$CurrentHabitStore;

abstract class _CurrentHabitStoreBase with Store {
  @observable
  int? id;

  @observable
  String? name;

  @observable
  String? description;

  @observable
  DateTime? dayOfCreation;

  @observable
  DateTime? startTime;

  @observable
  DateTime? endTime;

  List<bool>? daysOfWeek;

  List<DateTime>? doneDays;

  List<DateTime>? missedDays;

  int? currentScore;

  @observable
  Color? color = Colors.blue;

  _CurrentHabitStoreBase() {
    doneDays = [];
    missedDays = [];
    dayOfCreation = DateTime.now();
    currentScore = 0;
  }

  @action
  void setId(int id) {
    this.id = id;
  }

  @action
  void setName(String name) {
    this.name = name;
  }

  @action
  void setDescription(String description) {
    this.description = description;
  }

  @action
  void setStartTime(DateTime startTime) {
    this.startTime = startTime;
  }

  @action
  void setEndTime(DateTime endTime) {
    this.endTime = endTime;
  }

  @action
  void setColor(Color color) {
    this.color = color;
  }

  void setDaysOfWeek(List<bool> daysOfWeek) {
    this.daysOfWeek = daysOfWeek;
  }

  void markAsDoneToday() {
    doneDays!.add(DateTime.now());
    recalculateHabit();
  }

  void markSpecificDayAsDone(DateTime day) {
    doneDays!.add(day);
    recalculateHabit();
  }

  void recalculateHabit() {
    for (DateTime i = dayOfCreation!; i.compareTo(DateTime.now()) <= 0; i.add(Duration(days: 1))) 
    {
      if (daysOfWeek![i.weekday - 1] &&
          doneDays!.firstWhere(
                  (element) =>
                      element.day == i.day &&
                      element.year == element.year &&
                      element.month == element.month,
                  orElse: () => DateTime.utc(1990, 01, 01)) ==
              DateTime.utc(1990, 01, 01)) 
              {
                missedDays!.add(i);
                currentScore = 0;
                continue;
              }

      if (daysOfWeek![i.weekday - 1] &&
          doneDays!.firstWhere(
                  (element) =>
                      element.day == i.day &&
                      element.year == element.year &&
                      element.month == element.month,
                  orElse: () => DateTime.utc(1990, 01, 01)) !=
              DateTime.utc(1990, 01, 01)) 
              {
                doneDays!.add(i);
                currentScore = currentScore! + 1;
                continue;
              }
    }
  }

  @action
  void nullStore() {
    this.id = null;

    this.name = null;

    this.description = null;

    this.dayOfCreation = null;

    this.startTime = null;

    this.endTime = null;

    this.color = null;
  }
}
