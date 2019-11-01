enum TaskType { Call, Meeting }

class TaskModel {
  String task;
  String notes;
  DateTime date;
  TaskType taskType;
  bool complete;
  double porcentComplete;

  TaskModel({this.date, this.task, this.notes, this.taskType = TaskType.Meeting, this.complete = false, this.porcentComplete = 0});

  TaskModel.fromJson(Map<String, dynamic> json) {
    this.task = json['task'];
    this.notes = json['notes'];
    this.date = json['date'];
    this.taskType = json['taskType'];
    this.complete = json['complete'];
    this.porcentComplete = json['porcentComplete'];
  }

  toJson() {
    return Map<String, dynamic>()
      ..['task'] = task
      ..['notes'] = notes
      ..['date'] = date
      ..['taskType'] = taskType
      ..['complete'] = complete
      ..['porcentComplete'] = porcentComplete;
  }
}