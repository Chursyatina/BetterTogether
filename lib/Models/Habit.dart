import 'package:objectbox/objectbox.dart';

import 'User.dart';

@Entity()
class Habit {
  @Id()
  int id = 0;

  String? name;

  String? description;

  DateTime? date;

  List<DateTime>? doneDays;

  List<DateTime>? missedDays;

  final user = ToOne<User>();
}
