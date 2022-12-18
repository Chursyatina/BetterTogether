import 'package:bettertogether/Models/User.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id = 0;

  String? name;

  String? description;

  DateTime? date;

  List<String>? subtasks;

  bool? isDone;

  final user = ToOne<User>();
}
