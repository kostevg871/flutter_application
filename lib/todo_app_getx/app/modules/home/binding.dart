import 'package:flutter_apps/todo_app_getx/app/data/provider/task/provider.dart';
import 'package:flutter_apps/todo_app_getx/app/data/services/storage/repository.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
            taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        )));
  }
}
