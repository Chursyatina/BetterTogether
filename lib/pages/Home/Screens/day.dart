import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = Provider.of<UserRepository>(context);
    TaskRepository taskRepository = Provider.of<TaskRepository>(context);
    HabitRepository habitRepository = Provider.of<HabitRepository>(context);

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
          maxHeight: 410,
          minHeight: 150,
          body: Observer(builder: (_) {
            return ListView.builder(
                itemCount: taskRepository.tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(taskRepository.tasks[index].id.toString()),
                    child: Card(
                      child: ListTile(
                          title: Text(
                              taskRepository.tasks[index].name.toString())),
                    ),
                    onDismissed: (direction) {
                      taskRepository.removeTask(taskRepository.tasks[index]);
                    },
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
                        color: Colors.grey,
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
                        focusedDay: DateTime.now(),
                        calendarFormat: _calendarFormat,
                        onFormatChanged: ((format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }),
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
