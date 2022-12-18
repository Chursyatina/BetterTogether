import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:mobx/mobx.dart';
part 'current_day_store.g.dart';

class CurrentDayStore = _CurrentDayStoreBase with _$CurrentDayStore;

abstract class _CurrentDayStoreBase with Store {
  TaskRepository taskRepository;
  HabitRepository habitRepository;

  @observable
  DateTime? currentDay;

  @observable
  List<Task>? tasks;

  @observable
  List<Habit>? habits;

  _CurrentDayStoreBase(this.taskRepository, this.habitRepository) {
    this.update();
  }

  @action
  void setCurrentDay(DateTime dateTime) {
    this.currentDay = dateTime;
    this.update();
  }

  @action
  void update() {
    tasks = taskRepository.tasks
        .where((element) =>
            element.date!.year == currentDay!.year &&
            element.date!.month == currentDay!.month &&
            element.date!.day == currentDay!.day)
        .toList();

    habits = habitRepository.habits
        .where((element) =>
            element.date!.year == currentDay!.year &&
            element.date!.month == currentDay!.month &&
            element.date!.day == currentDay!.day)
        .toList();
  }
}
