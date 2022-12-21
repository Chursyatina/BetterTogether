import 'dart:ui';

import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/pages/Home/Screens/single/single_habbit.dart';
import 'package:bettertogether/pages/Home/Screens/single/single_task.dart';
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
  const TaskScreen({Key? key, required this.num}) : super(key: key);

  final int num;

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
      initialIndex: widget.num,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          toolbarHeight: 0,
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
            SingleTask(),
            SingleHabit(),
          ],
        ),
      ),
    );
  }
}

/*
   
*/
