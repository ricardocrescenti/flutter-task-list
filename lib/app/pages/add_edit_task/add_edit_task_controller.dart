import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/services/data_service.dart';
import 'package:task_list/models/task_model.dart';

class AddEditTaskController extends Controller {
  TaskModel task;

  GlobalKey<FormState> formState = GlobalKey();
  ValuesProvider formValues = ValuesProvider({
    'date': DateTime.now(),
    'task': '',
    'notes': '',
    'complete': ValueProvider<bool>(initialValue: false),
    'taskType': TaskType.Call
  });

  AddEditTaskController(Module module, this.task) : super(module) {
    if (task != null) {
      formValues.setValues({
        'date': task.date,
        'complete': task.complete,
        'task': task.task,
        'notes': task.notes,
        'taskType': task.taskType
      });
    }
  }
  
  save(BuildContext context) {
    if (formState.currentState.validate()) {

        TaskModel currentTask = TaskModel(
          DateTime.parse(formValues.getValue('date').toString()), 
          formValues.getValue('task'), 
          formValues.getValue('notes'),
          formValues.getValue('taskType'),
          complete: formValues.getValue('complete'));

      if (task == null) {
        module.service<DataService>().taks.addItem(currentTask);
      } else {
        module.service<DataService>().taks.replaceItem(task, currentTask);
      }
      _close(context);
    }
  }

  cancel(BuildContext context) {
    _close(context);
  }

  _close(BuildContext context) {
    Navigator.of(context).pop();
  }


  showDate(BuildContext context) async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null) {
      print(selectedDate.toString());
    }
    return selectedDate;
  }
  showTime(BuildContext context) async {
    TimeOfDay selectedTimeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTimeOfDay != null) {
      print(selectedTimeOfDay.toString());
    }
    return selectedTimeOfDay;
  }
}