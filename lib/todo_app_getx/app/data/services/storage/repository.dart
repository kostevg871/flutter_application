import 'package:flutter_apps/todo_app_getx/app/data/models/task.dart';
import 'package:flutter_apps/todo_app_getx/app/data/provider/task/provider.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> reaTasks() => taskProvider.readTasks();
  void writeTasks(List<Task> tasks) => taskProvider.writeTask(tasks);
}
