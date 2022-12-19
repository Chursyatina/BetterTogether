import 'package:bettertogether/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  Task(){
    isDone = false;
    color = Colors.blue;
  }

  @Id()
  int id = 0;

  String? name;

  String? description;

  DateTime? date;

  DateTime? endDate;

  DateTime? startTime;

  DateTime? endTime;

  Color? color;

  List<String>? subtasks;

  bool? isDone;

  final user = ToOne<User>();
}
