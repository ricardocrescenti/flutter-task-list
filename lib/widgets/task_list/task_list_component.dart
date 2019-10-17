import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/services/data_service.dart';
import 'package:task_list/models/task_model.dart';
import 'package:task_list/widgets/task_list/task_list_controller.dart';

class TaskListComponent extends Component<TaskListController> {
  @override
  initController(context, module) => TaskListController(module);

  @override
  Widget build(BuildContext context, Module module, TaskListController controller) {
    return ListConsumer(
      list: module.service<DataService>().taks,
      builder: (context, module, list) {
        return ListView.separated(
          itemCount: list.items.length,
          itemBuilder: (context, index) => buildTaksCard(context, controller, list.items[index]),
          separatorBuilder: (context, index) => Container(),
          padding: EdgeInsets.all(5),
        );
      }
    );
  }

  buildTaksCard(BuildContext context, TaskListController controller, TaskModel task) {
    return Dismissible(
      key: Key(UniqueKey().toString()),
      onDismissed: (direction) => controller.module.service<DataService>().taks.removeItem(task),
      child: GestureDetector(
        onTap: () => controller.openTask(context, task),
        child: Card(
          child: ListTile(
            leading: Checkbox(
              value: task.complete,
              onChanged: null,),
            title: Text(task.task),
            subtitle: Text(task.date.toString()),
          ),
        ),
      ),
    );
  }
}