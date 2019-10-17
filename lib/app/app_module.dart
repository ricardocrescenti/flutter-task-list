import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/pages/home/home_component.dart';
import 'package:task_list/app/pages/add_edit_task/add_edit_task_component.dart';
import 'package:task_list/app/services/app_service.dart';
import 'package:task_list/app/services/data_service.dart';
import 'package:task_list/models/models.dart';

class AppModule extends Module {

  @override
  List<Inject<Service>> get services => [
    Inject((m, arg) => AppService(m)),
    Inject((m, arg) => DataService(m)),
  ];

  @override
  List<Inject<Component<Controller>>> get components => [
    Inject((m, arg) => HomeComponent()),
    Inject((m, arg) => AddEditTaskComponent()),
  ];

  @override
  Widget build(BuildContext context) {

    return ServiceConsumer<AppService>(
      builder: (context, module, service) {

        return MaterialApp(
          title: 'Task List',
          theme: ThemeData(
            brightness: (service.darkMode ? Brightness.dark : Brightness.light),
            primarySwatch: Colors.blue,
          ),
          initialRoute: Page.home,
          routes: {
            Page.home: (context) => component<HomeComponent>(),
            Page.addEdit: (context) => component<AddEditTaskComponent>(),
          },
        );

      }
    );
    
  }
}