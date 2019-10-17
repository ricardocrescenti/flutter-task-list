class TaskModel {
  DateTime date;
  String task;
  String notes;
  bool complete;

  TaskModel(this.date, this.task, this.notes, {this.complete = false});
}