import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:task_list/app/services/app_service.dart';
//import 'package:task_list/app/services/data_service.dart';
import 'package:task_list/models/models.dart';
//import 'package:task_list/models/task_model.dart';

class HomeController extends Controller {
  AppService appService;
  
  HomeController(module) : super(module) {
    appService = module.service<AppService>();
  }

  newTask(BuildContext context) {
    Navigator.of(context).pushNamed(Page.addEdit);
    //module.service<DataService>().taks.insertItem(TaskModel(DateTime.now(), 'New taks', isComplete: true));
  }
}