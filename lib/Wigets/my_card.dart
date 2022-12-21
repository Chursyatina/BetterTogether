import 'package:bettertogether/Core/extensions.dart';
import 'package:bettertogether/Models/Base.dart';
import 'package:bettertogether/Models/DayMark.dart';
import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/pages/Home/Screens/task.dart';
import 'package:bettertogether/stores/current_day_store.dart';
import 'package:bettertogether/stores/current_habit_sttore.dart';
import 'package:bettertogether/stores/current_task_store.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key, required this.base, required this.currentDay});

  final Base base;
  final DateTime currentDay;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isChecked = widget.base is Task
        ? widget.base.isDone!
        : (widget.base as Habit).isDoneForDay(widget.currentDay);
  }

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    TaskRepository taskRepository = context.read<TaskRepository>();
    HabitRepository habitRepository = context.read<HabitRepository>();
    CurrentTaskStore currentTaskStore = context.read<CurrentTaskStore>();
    CurrentHabitStore currentHabitStore = context.read<CurrentHabitStore>();
    CurrentDayStore currentDayStore = context.read<CurrentDayStore>();

    return InkWell(
      onTap: () {
        if (widget.base is Task) {
          Task task = widget.base as Task;

          currentTaskStore.setName(task.name!);
          currentTaskStore.setDescription(task.description!);
          currentTaskStore.setDate(task.date!);
          currentTaskStore.setStartTime(task.startTime!);
          currentTaskStore.setEndTime(task.endTime!);
          currentTaskStore.setId(task.id);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TaskScreen(num: 0),
            ),
          );
        } else {
          Habit habit = widget.base as Habit;

          currentHabitStore.setName(habit.name!);
          currentHabitStore.setDescription(habit.description!);
          currentHabitStore.setStartTime(habit.startTime!);
          currentHabitStore.setEndTime(habit.endTime!);
          currentHabitStore.setId(habit.id);
          currentHabitStore.setDaysOfWeek(habit.getDates());

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TaskScreen(num: 1),
            ),
          );
        }
      },
      child: Dismissible(
        key: Key(widget.base.id.toString()),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: MSHCheckbox(
                        size: 30,
                        value: isChecked,
                        //currentDayStore.items[index].isDone!,
                        colorConfig:
                            MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: Colors.blue,
                        ),
                        style: MSHCheckboxStyle.stroke,
                        onChanged: (selected) {
                          setState(() {
                            isChecked = !isChecked;

                            if (widget.base is Task) {
                              widget.base.isDone = !widget.base.isDone!;
                              //taskRepository.putTask(widget.base as Task);
                            } else {
                              if ((widget.base as Habit)
                                  .isDayMarkExists(widget.currentDay)) {
                                (widget.base as Habit)
                                    .changeDoneForDay(widget.currentDay);
                                habitRepository.putDayMark(widget.base as Habit,
                                    DayMark(widget.currentDay));
                              } else {
                                habitRepository.putDayMark(widget.base as Habit,
                                    DayMark(widget.currentDay));
                                (widget.base as Habit)
                                    .changeDoneForDay(widget.currentDay);
                              }
                            }
                          });
                        },
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(widget.base.name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            widget.base.startTime!
                                    .getTimeInFormat(TimeStampFormat.parse_12) +
                                " - " +
                                widget.base.endTime!
                                    .getTimeInFormat(TimeStampFormat.parse_12),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
          if (widget.base is Task) {
            Task removable = widget.base as Task;
            currentDayStore.items.remove(removable);
            taskRepository.removeTask(removable);
          } else {
            Habit removable = widget.base as Habit;
            currentDayStore.items.remove(removable);
            habitRepository.removeHabit(removable);
          }
        },
      ),
    );
    ;
  }
}
