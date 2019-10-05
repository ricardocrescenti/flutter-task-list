class TaskModel {
  DateTime date;
  String description;
  bool isComplete;

  TaskModel(this.date, this.description, {this.isComplete = false});
}