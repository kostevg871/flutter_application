import 'package:flutter/material.dart';
import 'package:flutter_apps/todo_app_getx/app/core/utils/extansions.dart';
import 'package:flutter_apps/todo_app_getx/app/core/values/colors.dart';
import 'package:flutter_apps/todo_app_getx/app/data/models/task.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/controller.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/widgets/add_card.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/widgets/add_dialog.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/widgets/task_card.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0.wp),
                child: Text(
                  "My List",
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(
                () => GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ...controller.tasks
                        .map((e) => LongPressDraggable(
                            data: e,
                            onDragStarted: () =>
                                controller.changeDeleting(true),
                            onDraggableCanceled: (_, __) =>
                                controller.changeDeleting(false),
                            onDragEnd: (_) => controller.changeDeleting(false),
                            feedback: Opacity(
                              opacity: 0.8,
                              child: TaskCard(task: e),
                            ),
                            child: TaskCard(task: e)))
                        .toList(),
                    AddCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DragTarget<Task>(
        builder: (_, __, ___) {
          return Obx(
            () => FloatingActionButton(
              backgroundColor: controller.deleting.value ? Colors.red : blue,
              onPressed: () =>
                  Get.to(() => AddDialog(), transition: Transition.downToUp),
              child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
            ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess("Delete Sucess");
        },
      ),
    );
  }
}
