import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/pages/home/home_controller.dart';
import 'package:task_list/widgets/task_list/task_list_component.dart';

class HomeComponent extends Component<HomeController> {
  HomeComponent(Module module) : super(module);

  @override
  get initController => (m) => HomeController(m);

  @override
  Widget build(BuildContext context, HomeController controller) {
    return Scaffold(
      appBar: AppBar(title: Text('Task List'),),
      body: TaskListComponent(module),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'New task',
        onPressed: () => controller.newTask(),
      ),
    );
  }
}