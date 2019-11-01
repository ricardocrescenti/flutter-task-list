import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/services/data_service.dart';
import 'package:task_list/models/task_model.dart';

class AddEditTaskController extends Controller {
  TaskModel task;

  GlobalKey<FormState> formState = GlobalKey();
  ValuesProvider formValues = ValuesProvider(TaskModel().toJson());

  AddEditTaskController(Module module, this.task) : super(module) {
    if (task != null) {
      formValues.setValues(task.toJson());
    }
  }
  
  save(BuildContext context) {
    if (formState.currentState.validate()) {

      TaskModel currentTask = TaskModel.fromJson(formValues.values);
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