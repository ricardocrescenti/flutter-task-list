import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:module_provider/patterns/component.dart';
import 'package:module_provider/patterns/controller.dart';
import 'package:module_provider/patterns/module.dart';
import 'package:task_list/app/pages/add_edit_task/add_edit_task_component.dart';
import 'package:task_list/app/pages/home/home_component.dart';
import 'package:task_list/app/services/app_service.dart';
import 'package:task_list/models/models.dart';

class AppComponent extends Component {
  @override
  Widget build(BuildContext context, Module module, Controller controller) {
    return ServiceConsumer<AppService>(
      builder: (context, service) {

        return MaterialApp(
          title: 'Task List',
          theme: ThemeData(
            brightness: (service.darkMode ? Brightness.dark : Brightness.light),
            primarySwatch: Colors.blue,
          ),
          initialRoute: Page.home,
          routes: {
            Page.home: (context) => module.component<HomeComponent>(),
            Page.addEdit: (context) => module.component<AddEditTaskComponent>(),
          },
        );

      }
    );
  }
}