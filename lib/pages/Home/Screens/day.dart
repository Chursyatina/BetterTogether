import 'dart:ffi';

import 'package:bettertogether/Core/extensions.dart';
import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/pages/Home/Screens/task.dart';
import 'package:bettertogether/service_locator.dart';
import 'package:bettertogether/stores/current_day_store.dart';
import 'package:bettertogether/stores/current_habit_sttore.dart';
import 'package:bettertogether/stores/current_task_store.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';

class DayScreen extends StatefulWidget {
  const DayScreen({super.key});

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  int currentIndex = 0;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CurrentDayStore currentDayStore = getIt<CurrentDayStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CurrentTaskStore currentTaskStore = context.read<CurrentTaskStore>();
    currentTaskStore.nullStore();
    CurrentHabitStore currentHabitStore = context.read<CurrentHabitStore>();
    currentHabitStore.nullStore();
    currentDayStore.setCurrentDay(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    TaskRepository taskRepository = context.read<TaskRepository>();
    HabitRepository habitRepository = context.read<HabitRepository>();
    CurrentTaskStore currentTaskStore = context.read<CurrentTaskStore>();
    CurrentHabitStore currentHabitStore = context.read<CurrentHabitStore>();

    return Scaffold(
      body: SlidingUpPanel(
          renderPanelSheet: false,
          onPanelClosed: () {
            setState(() {
              _calendarFormat = CalendarFormat.week;
            });
          },
          onPanelOpened: () {
            setState(() {
              _calendarFormat = CalendarFormat.month;
            });
          },
          maxHeight: 415,
          minHeight: 150,
          body: Observer(builder: (_) {
            return ListView.builder(
                //itemCount: currentDayStore.tasks.length,
                itemCount: currentDayStore.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if (currentDayStore.items[index] is Task) {
                        Task task = currentDayStore.items[index] as Task;

                        currentTaskStore
                            .setName(task.name!);
                        currentTaskStore.setDescription(
                            task.description!);
                        currentTaskStore
                            .setDate(task.date!);
                        currentTaskStore.setStartTime(
                            task.startTime!);
                        currentTaskStore
                            .setEndTime(task.endTime!);
                        currentTaskStore.setId(task.id);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TaskScreen(num: 0),
                          ),
                        );
                      } else {
                        Habit habit = currentDayStore.items[index] as Habit;
                        
                        currentHabitStore
                            .setName(habit.name!);
                        currentHabitStore.setDescription(
                            habit.description!);
                        currentHabitStore.setStartTime(
                            habit.startTime!);
                        currentHabitStore
                            .setEndTime(habit.endTime!);
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
                      key: Key(currentDayStore.items[index].id.toString()),
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
                                      value:
                                          currentDayStore.items[index].isDone!,
                                      colorConfig: MSHColorConfig
                                          .fromCheckedUncheckedDisabled(
                                        checkedColor: Colors.blue,
                                      ),
                                      style: MSHCheckboxStyle.stroke,
                                      onChanged: (selected) {
                                        setState(() {
                                          currentDayStore.items[index].isDone =
                                              !currentDayStore
                                                  .items[index].isDone!;
                                        });
                                      },
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                            currentDayStore.items[index].name
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          currentDayStore
                                                  .items[index].startTime!
                                                  .getTimeInFormat(
                                                      TimeStampFormat
                                                          .parse_12) +
                                              " - " +
                                              currentDayStore
                                                  .items[index].endTime!
                                                  .getTimeInFormat(
                                                      TimeStampFormat.parse_12),
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
                        if (currentDayStore.items[index] is Task) {
                          Task removable = currentDayStore.items[index] as Task;
                          currentDayStore.items.remove(removable);
                          taskRepository.removeTask(removable);
                        } else {
                          Habit removable =
                              currentDayStore.items[index] as Habit;
                          currentDayStore.items.remove(removable);
                          habitRepository.removeHabit(removable);
                        }
                      },
                    ),
                  );
                });
          }),
          panel: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/single');
                    },
                    child: Container(
                      padding: EdgeInsets.all(13),
                      width: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15.0,
                            color: Colors.grey,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(30)),
                      ),
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.add, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          color: Colors.grey,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.black,
                          height: 4,
                          width: 40,
                        ),
                      ),
                      TableCalendar(
                        headerVisible: false,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _focusedDay,
                        calendarFormat: _calendarFormat,
                        selectedDayPredicate: ((day) {
                          return isSameDay(_selectedDay, day);
                        }),
                        onFormatChanged: ((format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }),
                        onDaySelected: (selectedDay, focusedDay) {
                          currentDayStore.setCurrentDay(focusedDay);

                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                      ),
                    ],
                  ),
                )),
              ],
            ),
          )),
    );
  }
}
