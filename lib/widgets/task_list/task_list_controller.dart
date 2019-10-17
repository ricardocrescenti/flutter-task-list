import 'package:flutter/cupertino.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/models/models.dart';
import 'package:task_list/models/task_model.dart';

class TaskListController extends Controller {
  TaskListController(Module module) : super(module);

  openTask(BuildContext context, TaskModel task) {
    Navigator.of(context).pushNamed(Page.addEdit, arguments: task);
  }
}