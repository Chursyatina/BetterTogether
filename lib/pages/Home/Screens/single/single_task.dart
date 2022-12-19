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

class SingleTask extends StatefulWidget {
  const SingleTask({super.key});

  @override
  State<SingleTask> createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {
  final GlobalKey<FormState> _form = GlobalKey();
  late CurrentTaskStore currentTaskStore;

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _startDateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  late TextEditingController _endDateController;

  @override
  void initState() {
    super.initState();

    CurrentTaskStore currentTaskStore = context.read<CurrentTaskStore>();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _startDateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
    _endDateController = TextEditingController();

    if (currentTaskStore.name != null){
      _nameController.text = currentTaskStore.name!;
    }

    if (currentTaskStore.description != null){
      _descriptionController.text = currentTaskStore.description!;
    }

    if (currentTaskStore.date != null){
      _startDateController.text = currentTaskStore.date!.dateToStringWithFormat(format: "dd/MM/yyyy");;
    }
    else{
      _startDateController.text =
        DateTime.now().dateToStringWithFormat(format: "dd/MM/yyyy");
      currentTaskStore.setDate(DateTime.now());
    }

    if (currentTaskStore.endDate != null){
      _endDateController.text = currentTaskStore.endDate!.dateToStringWithFormat(format: "dd/MM/yyyy");;
    }
    else{
      _endDateController.text =
        DateTime.now().dateToStringWithFormat(format: "dd/MM/yyyy");
      currentTaskStore.setEndDate(DateTime.now());
    }

    if (currentTaskStore.startTime != null){
      _startTimeController.text = currentTaskStore.startTime!.getTimeInFormat(TimeStampFormat.parse_12);
    }
    else{
      _startTimeController.text =
        DateTime.now().getTimeInFormat(TimeStampFormat.parse_12);
    currentTaskStore.setStartTime(DateTime.now());
    }
    
    if (currentTaskStore.endTime != null){
      _endTimeController.text = currentTaskStore.endTime!.getTimeInFormat(TimeStampFormat.parse_12);
    }
    else{
      _endTimeController.text =
        DateTime.now().add(Duration(hours: 1)).getTimeInFormat(TimeStampFormat.parse_12);
    currentTaskStore.setEndTime(DateTime.now().add(Duration(hours: 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    TaskRepository taskRepository = context.read<TaskRepository>();
    HabitRepository habitRepository = context.read<HabitRepository>();
    CurrentTaskStore currentTaskStore = context.read<CurrentTaskStore>();

    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameController,
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
                      currentTaskStore.startTime!.hour !=
                          currentTaskStore.endTime!.hour ||
                      currentTaskStore.startTime!.minute -
                              currentTaskStore.endTime!.minute >
                          4) {
                    task.endTime = currentTaskStore.endTime;
                  } else {
                    task.endTime =
                        currentTaskStore.endTime!.add(Duration(hours: 1));
                  }

                  task.color = Colors.blue;


                  if (currentTaskStore.id != null){
                    Task previous = taskRepository.tasks.firstWhere((element) => element.id == currentTaskStore.id);
                    taskRepository.tasks[taskRepository.tasks.indexOf(previous)].name = task.name;
                    taskRepository.tasks[taskRepository.tasks.indexOf(previous)].description = task.description;
                    taskRepository.tasks[taskRepository.tasks.indexOf(previous)].date = task.date;
                    taskRepository.tasks[taskRepository.tasks.indexOf(previous)].endDate = task.endDate;
                    taskRepository.tasks[taskRepository.tasks.indexOf(previous)].startTime = task.startTime;
                    taskRepository.tasks[taskRepository.tasks.indexOf(previous)].endTime = task.endTime;
                    taskRepository.tasks[taskRepository.tasks.indexOf(previous)].color = task.color;
                  }
                  else {
                    taskRepository.putTask(task);
                  }

                  currentTaskStore.nullStore();

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
