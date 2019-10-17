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
  });

  AddEditTaskController(Module module, this.task) : super(module) {
    if (task != null) {
      formValues.setValues({
        'complete': task.complete,
        'task': task.task,
        'notes': task.notes
      });
    }
  }
  
  save(BuildContext context) {
    if (formState.currentState.validate()) {

        TaskModel currentTask = TaskModel(
          formValues.getValue('date'), 
          formValues.getValue('task'), 
          formValues.getValue('notes'),
          complete: formValues.getValue('complete'));

      if (task == null) {
        module.service<DataService>().taks.insertItem(currentTask);
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
}