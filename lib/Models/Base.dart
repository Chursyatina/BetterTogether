import 'package:bettertogether/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Base {
  int id = 0;

  String? name;

  String? description;

  DateTime? startTime;

  DateTime? endTime;

  bool? isDone;
}
