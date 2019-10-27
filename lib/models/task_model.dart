enum TaskType { Call, Meeting }

class TaskModel {
  String task;
  String notes;
  DateTime date;
  TaskType taskType;
  bool complete;

  TaskModel(this.date, this.task, this.notes, this.taskType, {this.complete = false});
}