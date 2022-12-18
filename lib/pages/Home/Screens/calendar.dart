import 'dart:ui';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MonthView(),
        );
  }
}
