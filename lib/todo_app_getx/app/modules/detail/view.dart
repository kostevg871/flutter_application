import 'package:flutter/material.dart';
import 'package:flutter_apps/todo_app_getx/app/core/utils/extansions.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/detail/widgets/doing_list.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/detail/widgets/done_list.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DetailsPage extends StatelessWidget {
  final homecntrl = Get.find<HomeController>();
  DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = homecntrl.task.value!;
    var color = HexColor.fromHex(task.color);
    return Scaffold(
      body: Form(
        key: homecntrl.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                        homecntrl.updateTodos();
                        homecntrl.changeTask(null);
                        homecntrl.editCtrl.clear();
                      },
                      icon: const Icon(Icons.arrow_back)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Row(
                children: [
                  Icon(
                    IconData(
                      task.icon,
                      fontFamily: "MaterialIcons",
                    ),
                    color: color,
                  ),
                  SizedBox(
                    width: 3.0.wp,
                  ),
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              var totalTodos =
                  homecntrl.doingTodos.length + homecntrl.doneTodos.length;
              return Padding(
                padding:
                    EdgeInsets.only(left: 12.0.wp, top: 3.0.wp, right: 12.0.wp),
                child: Row(
                  children: [
                    Text(
                      "$totalTodos Tasks",
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 3.0.wp,
                    ),
                    Expanded(
                      child: StepProgressIndicator(
                        totalSteps: totalTodos == 0 ? 1 : totalTodos,
                        currentStep: homecntrl.doneTodos.length,
                        size: 5,
                        padding: 0,
                        selectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [color.withOpacity(0.5), color]),
                        unselectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.grey[300]!, Colors.grey[300]!]),
                      ),
                    ),
                  ],
                ),
              );
            }),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 5.0.wp),
              child: TextFormField(
                controller: homecntrl.editCtrl,
                autofocus: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  prefixIcon: Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (homecntrl.formKey.currentState!.validate()) {
                        var success =
                            homecntrl.addTodo(homecntrl.editCtrl.text);
                        if (success) {
                          EasyLoading.showSuccess("Todo item add success");
                          homecntrl.updateTodos();
                        } else {
                          EasyLoading.showError('Todo item already exist');
                        }
                        homecntrl.editCtrl.clear();
                      }
                    },
                    icon: const Icon(Icons.done),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your todo item";
                  }
                  return null;
                },
              ),
            ),
            DoingList(),
            DoneList(),
          ],
        ),
      ),
    );
  }
}
