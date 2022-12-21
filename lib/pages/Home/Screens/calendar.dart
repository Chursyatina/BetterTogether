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
            endDate: element.endDate,
            startTime: element.startTime,
            endTime: element.endTime,
            event: element.id,
            color: !element.isDone!? element.color! : Colors.grey);

        controller.add(event);
      });

      DateTime monthLater = DateTime.now().add(Duration(days: 30));

      habitRepository.habits.forEach((element) {
        DateTime day = element.dateOfCreation!;

        while (day.compareTo(monthLater) <= 0){
          if (element.isDaySelected(day.weekday - 1)) {
            CalendarEventData event = CalendarEventData(
              title: element.name!,
              date: day,
              startTime: element.startTime,
              endTime: element.endTime,
              event: element.id,
              color: !element.isDoneForDay(day)? Colors.red: Colors.grey,
            );

            controller.add(event);
          }

          day = day.add(Duration(days: 1));
        }
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
          toolbarHeight: 0,
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
