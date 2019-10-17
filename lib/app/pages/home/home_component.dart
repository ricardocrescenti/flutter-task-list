import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/pages/home/home_controller.dart';
import 'package:task_list/widgets/task_list/task_list_component.dart';

class HomeComponent extends Component<HomeController> {
  @override
  initController(context, module) => HomeController(module);

  @override
  Widget build(BuildContext context, Module module, HomeController controller) {
    return Scaffold(
      appBar: buildAppBar(controller),
      body: TaskListComponent(),
      floatingActionButton: buildFloatingActionButton(context, controller),
    );
  }

  buildAppBar(HomeController controller) {
    return AppBar(
      title: Text('Task List'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.adjust),
          onPressed: () => controller.appService.changeDarkMode(),
        )
      ],
    );
  }
  buildFloatingActionButton(BuildContext context, HomeController controller) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      tooltip: 'New task',
      onPressed: () => controller.newTask(context),
    );
  }
}