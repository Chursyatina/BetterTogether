import 'package:bettertogether/Models/Base.dart';
import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DayMark{
  DayMark(DateTime date){
    isDone = false;
    this.date = date;
  }

  @Id()
  int id = 0;

  bool? isDone;

  DateTime date = DateTime.now();

  final habit = ToOne<Habit>();
}
