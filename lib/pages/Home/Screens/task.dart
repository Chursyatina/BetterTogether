import 'dart:ui';

import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/service_locator.dart';
import 'package:bettertogether/stores/current_task_store.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../Core/theme.dart';
import '../../../Models/Task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final currentTaskStore = CurrentTaskStore();

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    TaskRepository taskRepository = context.read<TaskRepository>();
    HabitRepository habitRepository = context.read<HabitRepository>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          toolbarHeight: 10,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Task",
              ),
              Tab(text: "Habit"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 30,
                    child: Observer(builder: (_) {
                      return TextField(
                        controller: TextEditingController()
                          ..text = currentTaskStore.name,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Task'),
                        onChanged: (value) {
                          currentTaskStore.setName(value);
                        },
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 30,
                    child: Observer(builder: (_) {
                      return TextField(
                        controller: TextEditingController()
                          ..text = currentTaskStore.description,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description'),
                        onChanged: (value) {
                          currentTaskStore.setDescription(value);
                        },
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 30,
                    child: Observer(builder: (_) {
                      return DateTimePicker(
                        type: DateTimePickerType.date,
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onChanged: ((value) {
                          currentTaskStore.setDate(DateTime.parse(value));
                        }),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Task task = Task();
                      task.name = currentTaskStore.name;
                      task.description = currentTaskStore.description;
                      task.date = currentTaskStore.date;
                      taskRepository.putTask(task);
                      Navigator.restorablePushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                    child: Container(
                      padding: EdgeInsets.all(13),
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(30)),
                      ),
                      alignment: Alignment.bottomRight,
                      child: const Text("Complete"),
                    ),
                  ),
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

/*
   
*/
