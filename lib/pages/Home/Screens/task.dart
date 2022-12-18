import 'dart:ui';

import 'package:bettertogether/stores/current_task_store.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 139, 249, 85)),
          child: Container(
            alignment: Alignment.topLeft,
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
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 79, 198, 241),
          ),
          child: SizedBox(
            height: 30,
            child: Observer(builder: (_) {
              return TextField(
                controller: TextEditingController()
                  ..text = currentTaskStore.description,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Description'),
                onChanged: (value) {
                  currentTaskStore.setDescription(value);
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
