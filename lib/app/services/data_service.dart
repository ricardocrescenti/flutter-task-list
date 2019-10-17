import 'package:module_provider/module_provider.dart';
import 'package:task_list/models/task_model.dart';

class DataService extends Service {
  ListProvider<TaskModel> taks = ListProvider(initialItems: []);

  DataService(Module module) : super(module);
}