import 'package:bettertogether/pages/Home/Screens/task.dart';
import 'package:flutter/material.dart';
import 'package:bettertogether/pages/Home/Screens/calendar.dart';
import 'package:bettertogether/pages/Home/Screens/day.dart';
import 'package:bettertogether/pages/Home/Screens/profile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Core/naviagtionBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screen = <Widget>[
    const DayScreen(),
    const CalendarScreen(),
    const TaskScreen(),
  ];
  int currentIndex = 0;
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screen[currentIndex]),
      bottomNavigationBar: HomePageNavigation(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
