import 'dart:ui';

import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  EventController controller = EventController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, (() {
      TaskRepository taskRepository = context.read<TaskRepository>();
      HabitRepository habitRepository = context.read<HabitRepository>();

      taskRepository.tasks.forEach((element) {
        CalendarEventData event = CalendarEventData(
            title: element.name!,
            date: element.date!,
            startTime: DateTime.now(),
            endTime: DateTime.now().add(const Duration(hours: 2)),
            event: element.id,
            endDate: element.date);

        controller.add(event);
      });

      habitRepository.habits.forEach((element) {
        CalendarEventData event = CalendarEventData(
            title: element.name!,
            date: element.date!,
            event: element.id,
            endDate: element.date);

        controller.add(event);
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          toolbarHeight: 10,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Week view",
              ),
              Tab(text: "Month view"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CalendarControllerProvider(
              controller: controller,
              child: Scaffold(
                body: WeekView(),
              ),
            ),
            CalendarControllerProvider(
              controller: controller,
              child: Scaffold(
                body: MonthView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
