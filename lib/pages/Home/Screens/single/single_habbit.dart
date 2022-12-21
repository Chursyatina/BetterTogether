import 'package:bettertogether/Core/app_colors.dart';
import 'package:bettertogether/Core/constants.dart';
import 'package:bettertogether/Core/extensions.dart';
import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/Wigets/custom_button.dart';
import 'package:bettertogether/Wigets/date_time_selector.dart';
import 'package:bettertogether/stores/current_habit_sttore.dart';
import 'package:bettertogether/stores/current_task_store.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:weekday_selector/weekday_selector.dart';

class SingleHabit extends StatefulWidget {
  const SingleHabit({super.key});

  @override
  State<SingleHabit> createState() => _SingleHabitState();
}

class _SingleHabitState extends State<SingleHabit> {
  final GlobalKey<FormState> _form = GlobalKey();
  late CurrentHabitStore currentHabitStore;

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  var daysOfWeek = List.filled(7, true);
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  late TextEditingController _endDateController;

  @override
  void initState() {
    super.initState();

    CurrentHabitStore currentHabitStore = context.read<CurrentHabitStore>();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
    _endDateController = TextEditingController();

    if (currentHabitStore.name != null) {
      _nameController.text = currentHabitStore.name!;
    }

    if (currentHabitStore.description != null) {
      _descriptionController.text = currentHabitStore.description!;
    }

    if (currentHabitStore.startTime != null) {
      _startTimeController.text =
          currentHabitStore.startTime!.getTimeInFormat(TimeStampFormat.parse_12);
    } else {
      _startTimeController.text =
          DateTime.now().getTimeInFormat(TimeStampFormat.parse_12);
      currentHabitStore.setStartTime(DateTime.now());
    }

    if (currentHabitStore.endTime != null) {
      _endTimeController.text =
          currentHabitStore.endTime!.getTimeInFormat(TimeStampFormat.parse_12);
    } else {
      _endTimeController.text = DateTime.now()
          .add(Duration(hours: 1))
          .getTimeInFormat(TimeStampFormat.parse_12);
      currentHabitStore.setEndTime(DateTime.now().add(Duration(hours: 1)));
    }

    if (currentHabitStore.daysOfWeek != null){
      daysOfWeek = currentHabitStore.daysOfWeek!;
    }
    else{
      daysOfWeek = List.filled(7, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    TaskRepository taskRepository = context.read<TaskRepository>();
    HabitRepository habitRepository = context.read<HabitRepository>();
    CurrentHabitStore currentHabitStore = context.read<CurrentHabitStore>();

    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 20),
            child: TextFormField(
              controller: _nameController,
              decoration: AppConstants.inputDecoration.copyWith(
                labelText: "Habit name",
              ),
              style: TextStyle(
                color: AppColors.black,
                fontSize: 17.0,
              ),
              validator: (value) {
                if (value == null || value == "")
                  return "Please habit task name.";

                return null;
              },
              onChanged: (value) {
                currentHabitStore.setName(value);
              },
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: WeekdaySelector(
                    onChanged: (int day) {
                      setState(() {
                        final index = day % 7;
                        daysOfWeek[index] = !daysOfWeek[index];
                      });
                    },
                    values: daysOfWeek,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 15),
                  child: DateTimeSelectorFormField(
                    controller: _startTimeController,
                    decoration: AppConstants.inputDecoration.copyWith(
                      labelText: "Start Time",
                    ),
                    validator: (value) {
                      if (value == null || value == "")
                        return "Please select start time.";

                      return null;
                    },
                    onSave: (time) {
                      currentHabitStore.setStartTime(time);
                    },
                    textStyle: TextStyle(
                      color: AppColors.black,
                      fontSize: 17.0,
                    ),
                    type: DateTimeSelectionType.time,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 15),
                  child: DateTimeSelectorFormField(
                    controller: _endTimeController,
                    decoration: AppConstants.inputDecoration.copyWith(
                      labelText: "End Time",
                    ),
                    validator: (value) {
                      if (value == null || value == "")
                        return "Please select end time.";

                      return null;
                    },
                    onSave: (time) {
                      currentHabitStore.setEndTime(time);
                    },
                    textStyle: TextStyle(
                      color: AppColors.black,
                      fontSize: 17.0,
                    ),
                    type: DateTimeSelectionType.time,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              //focusNode: _descriptionNode,
              controller: _descriptionController,
              decoration: AppConstants.inputDecoration.copyWith(
                labelText: "Event Description",
              ),
              style: TextStyle(
                color: AppColors.black,
                fontSize: 17.0,
              ),
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              selectionControls: MaterialTextSelectionControls(),
              minLines: 1,
              maxLines: 10,
              maxLength: 1000,
              validator: (value) {
                if (value == null || value.trim() == "")
                  return "Please enter event description.";

                return null;
              },
              onChanged: (value) {
                currentHabitStore.setDescription(value);
              },
            ),
          ),
          // SizedBox(
          //   height: 15.0,
          // ),
          // Row(
          //   children: [
          //     Text(
          //       "Event Color: ",
          //       style: TextStyle(
          //         color: AppColors.black,
          //         fontSize: 17,
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: _displayColorPicker,
          //       child: CircleAvatar(
          //         radius: 15,
          //         backgroundColor: currentTaskStore.color,
          //       ),
          //     ),
          //   ],
          // ),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  if (!(_form.currentState?.validate() ?? true)) return;

                  _form.currentState?.save();

                  Habit habit = Habit();
                  habit.name = currentHabitStore.name;
                  habit.description = currentHabitStore.description;

                  habit.startTime = currentHabitStore.startTime;

                  if (currentHabitStore.startTime!.day !=
                          currentHabitStore.endTime!.day ||
                      currentHabitStore.startTime!.hour !=
                          currentHabitStore.endTime!.hour ||
                      currentHabitStore.startTime!.minute -
                              currentHabitStore.endTime!.minute >
                          4) {
                    habit.endTime = currentHabitStore.endTime;
                  } else {
                    habit.endTime =
                        currentHabitStore.endTime!.add(Duration(hours: 1));
                  }

                  habit.color = Colors.blue;

                  habit.setDaysOfWeek(daysOfWeek);

                  if (currentHabitStore.id != null) {
                    Habit previous = habitRepository.habits.firstWhere(
                        (element) => element.id == currentHabitStore.id);
                    habitRepository.habits[habitRepository.habits.indexOf(previous)]
                        .name = habit.name;
                    habitRepository.habits[habitRepository.habits.indexOf(previous)]
                        .description = habit.description;
                    habitRepository.habits[habitRepository.habits.indexOf(previous)]
                        .startTime = habit.startTime;
                    habitRepository.habits[habitRepository.habits.indexOf(previous)]
                        .endTime = habit.endTime;
                    habitRepository.habits[habitRepository.habits.indexOf(previous)]
                        .setDaysOfWeek(daysOfWeek);
                    habitRepository.habits[habitRepository.habits.indexOf(previous)]
                        .color = habit.color;
                      
                    habitRepository.putHabit(habitRepository.habits[habitRepository.habits.indexOf(previous)]);
                  } else {
                    habit.recalculateHabit();
                    habitRepository.putHabit(habit);
                  }

                  currentHabitStore.nullStore();

                  _resetForm();

                  Navigator.restorablePushNamedAndRemoveUntil(
                      context, '/', (route) => false);
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
          ),
        ],
      ),
    );
  }

  void _displayColorPicker() {
    Color color = Colors.blue;
    showDialog(
      context: context,
      useSafeArea: true,
      barrierColor: Colors.black26,
      builder: (_) => SimpleDialog(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: AppColors.bluishGrey,
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.all(20.0),
        children: [
          Text(
            "Event Color",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 25.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 1.0,
            color: AppColors.bluishGrey,
          ),
          ColorPicker(
            displayThumbColor: true,
            enableAlpha: false,
            pickerColor: Colors.blue,
            onColorChanged: (c) {
              color = c;
            },
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 30.0),
              child: CustomButton(
                title: "Select",
                onTap: () {
                  if (mounted)
                    setState(() {
                      currentHabitStore.setColor(color);
                    });
                  context.pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _resetForm() {
    _form.currentState?.reset();
    _endTimeController.text = "";
    _startTimeController.text = "";
  }
}
