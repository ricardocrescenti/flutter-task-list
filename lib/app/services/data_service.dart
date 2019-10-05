import 'package:module_provider/module_provider.dart';
import 'package:task_list/models/task_model.dart';

class DataService extends Service {
  ListProvider<TaskModel> taks = ListProvider(initialItems: [
    TaskModel(DateTime.now().add(Duration(minutes: 5)), 'Task 1'),
    TaskModel(DateTime.now().add(Duration(minutes: 10)), 'Task 2'),
    TaskModel(DateTime.now().add(Duration(minutes: 15)), 'Task 3'),
    TaskModel(DateTime.now().add(Duration(minutes: 20)), 'Task 4'),
    TaskModel(DateTime.now().add(Duration(minutes: 25)), 'Task 5'),
  ]);

  DataService(Module module) : super(module);
}