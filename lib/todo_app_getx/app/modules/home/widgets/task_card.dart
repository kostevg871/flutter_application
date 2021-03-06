import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_apps/todo_app_getx/app/core/utils/extansions.dart';
import 'package:flutter_apps/todo_app_getx/app/data/models/task.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/detail/view.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/controller.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TaskCard extends StatelessWidget {
  final homeCntrl = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    var squareWidth = Get.width - 12.0.wp;
    return GestureDetector(
      onTap: () {
        homeCntrl.changeTask(task);
        homeCntrl.changeTodos(task.todos ?? []);
        Get.to(() => DetailsPage());
      },
      child: Container(
        width: squareWidth / 2,
        height: squareWidth / 2,
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 7,
            offset: const Offset(0, 7),
          ),
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepProgressIndicator(
              totalSteps: homeCntrl.isTodosEmpty(task) ? 1 : task.todos!.length,
              currentStep: homeCntrl.isTodosEmpty(task)
                  ? 0
                  : homeCntrl.getDoneTodo(task),
              size: 5,
              padding: 0,
              selectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.5), color],
              ),
              unselectedGradientColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                IconData(task.icon, fontFamily: "MaterialIcons"),
                color: color,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12.0.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2.0.wp,
                  ),
                  Text(
                    "${task.todos?.length ?? 0} Task",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
