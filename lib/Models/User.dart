import 'package:objectbox/objectbox.dart';

import 'Habit.dart';
import 'Task.dart';

@Entity()
class User {
  @Id()
  int id = 0;

  String? name;

  @Backlink('user')
  final tasks = ToMany<Task>();

  @Backlink('user')
  final habits = ToMany<Habit>();
}
