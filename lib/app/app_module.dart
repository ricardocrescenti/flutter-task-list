import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/app_component.dart';
import 'package:task_list/app/pages/home/home_component.dart';
import 'package:task_list/app/pages/add_edit_task/add_edit_task_component.dart';
import 'package:task_list/app/services/app_service.dart';
import 'package:task_list/app/services/data_service.dart';

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
  initialize(BuildContext context) {
    service<AppService>().changeDarkMode();
  }

  @override
  Widget build(BuildContext context) => AppComponent();
}