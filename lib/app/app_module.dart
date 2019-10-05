import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/pages/home/home_component.dart';
import 'package:task_list/app/services/data_service.dart';

class AppModule extends Module {
  AppModule() : super(null);

  @override
  List<Inject<Service>> get services => [
    Inject((m, arg) => DataService(m))
  ];

  @override
  List<Inject<Component<Controller>>> get components => [
    Inject((m, arg) => HomeComponent(m))
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: component<HomeComponent>(),
    );
  }

}