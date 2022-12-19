import 'package:bettertogether/Core/app_colors.dart';
import 'package:bettertogether/Core/constants.dart';
import 'package:bettertogether/Core/extensions.dart';
import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/Wigets/custom_button.dart';
import 'package:bettertogether/Wigets/date_time_selector.dart';
import 'package:bettertogether/stores/current_task_store.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class SingleHabit extends StatefulWidget {
  const SingleHabit({super.key});

  @override
  State<SingleHabit> createState() => _SingleHabitState();
}

class _SingleHabitState extends State<SingleHabit> {
  final GlobalKey<FormState> _form = GlobalKey();
  final currentTaskStore = CurrentTaskStore();

  late TextEditingController _startDateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  late TextEditingController _endDateController;

  @override
  void initState() {
    super.initState();

    _startDateController = TextEditingController();
    _startDateController.text =
        DateTime.now().dateToStringWithFormat(format: "dd/MM/yyyy");
    currentTaskStore.setDate(DateTime.now());

    _endDateController = TextEditingController();
    _endDateController.text =
        DateTime.now().dateToStringWithFormat(format: "dd/MM/yyyy");
    currentTaskStore.setEndDate(DateTime.now());

    _startTimeController = TextEditingController();
    _startTimeController.text =
        DateTime.now().getTimeInFormat(TimeStampFormat.parse_12);
    currentTaskStore.setStartTime(DateTime.now());

    _endTimeController = TextEditingController();
    _endTimeController.text = DateTime.now()
        .add(Duration(hours: 1))
        .getTimeInFormat(TimeStampFormat.parse_12);
    currentTaskStore.setEndTime(DateTime.now().add(Duration(hours: 1)));
  }

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    TaskRepository taskRepository = context.read<TaskRepository>();
    HabitRepository habitRepository = context.read<HabitRepository>();

    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: AppConstants.inputDecoration.copyWith(
                labelText: "Task name",
              ),
              style: TextStyle(
                color: AppColors.black,
                fontSize: 17.0,
              ),
              validator: (value) {
                if (value == null || value == "")
                  return "Please enter task name.";

                return null;
              },
              onChanged: (value) {
                currentTaskStore.setName(value);
              },
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: DateTimeSelectorFormField(
                    controller: _startDateController,
                    decoration: AppConstants.inputDecoration.copyWith(
                      labelText: "Date",
                    ),
                    validator: (value) {
                      if (value == null || value == "")
                        return "Please select date.";

                      return null;
                    },
                    textStyle: TextStyle(
                      color: AppColors.black,
                      fontSize: 17.0,
                    ),
                    onSave: (date) {
                      currentTaskStore.setDate(date);
                    },
                    type: DateTimeSelectionType.date,
                  ),
                ),
              ),
              // SizedBox(width: 20.0),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(bottom: 8),
              //     child: DateTimeSelectorFormField(
              //       controller: _endDateController,
              //       decoration: AppConstants.inputDecoration.copyWith(
              //         labelText: "End Date",
              //       ),
              //       validator: (value) {
              //         if (value == null || value == "")
              //           return "Please select date.";

              //         return null;
              //       },
              //       textStyle: TextStyle(
              //         color: AppColors.black,
              //         fontSize: 17.0,
              //       ),
              //       onSave: (date) {
              //         currentTaskStore.setEndDate(date);
              //       },
              //       type: DateTimeSelectionType.date,
              //     ),
              //   ),
              // ),
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
                      currentTaskStore.setStartTime(time);
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
                      currentTaskStore.setEndTime(time);
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
                currentTaskStore.setDescription(value);
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

                  Task task = Task();
                  task.name = currentTaskStore.name;
                  task.description = currentTaskStore.description;
                  task.date = currentTaskStore.date;
                  if (currentTaskStore.endDate!.month >
                          currentTaskStore.endDate!.month ||
                      currentTaskStore.endDate!.day >
                          currentTaskStore.endDate!.day) {
                    task.endDate = currentTaskStore.endDate;
                  } else {
                    task.endDate = currentTaskStore.date;
                  }

                  task.startTime = currentTaskStore.startTime;

                  if (currentTaskStore.startTime!.day !=
                          currentTaskStore.endTime!.day ||
                      currentTaskStore.startTime!.day !=
                          currentTaskStore.endTime!.day ||
                      currentTaskStore.startTime!.minute -
                              currentTaskStore.endTime!.minute >
                          4) {
                    task.endTime = currentTaskStore.endTime;
                  } else {
                    task.endTime =
                        currentTaskStore.endTime!.add(Duration(hours: 1));
                  }

                  task.color = currentTaskStore.color;

                  taskRepository.putTask(task);

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
                      currentTaskStore.setColor(color);
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
    _startDateController.text = "";
    _endTimeController.text = "";
    _startTimeController.text = "";
  }
}
