import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/services/data_service.dart';
import 'package:task_list/models/task_model.dart';
import 'package:task_list/widgets/task_list/task_list_controller.dart';

class TaskListComponent extends Component<TaskListController> {
  TaskListComponent(Module module) : super(module);

  @override
  Widget build(BuildContext context, TaskListController controller) {
    return ListConsumer(
      list: module.service<DataService>().taks,
      builder: (context, list) {
        return ListView.separated(
          itemCount: list.items.length,
          itemBuilder: (context, index) => buildTaksCard(list.items[index]),
          separatorBuilder: (context, index) => Container(),
        );
      }
    );
  }

  buildTaksCard(TaskModel task) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: task.isComplete,
          onChanged: null,),
        title: Text(task.description),
        subtitle: Text(task.date.toString()),
      ),
    );
  }
}