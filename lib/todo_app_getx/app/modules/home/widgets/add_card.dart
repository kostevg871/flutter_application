import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/todo_app_getx/app/core/utils/extansions.dart';
import 'package:flutter_apps/todo_app_getx/app/core/values/colors.dart';
import 'package:flutter_apps/todo_app_getx/app/data/models/task.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/controller.dart';
import 'package:flutter_apps/todo_app_getx/app/widgets/icons.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AddCard extends StatelessWidget {
  final homeCntrl = Get.find<HomeController>();
  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 5,
              title: "Task Type",
              content: Form(
                key: homeCntrl.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                        child: TextFormField(
                          controller: homeCntrl.editCtrl,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Title",
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your task title";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0.wp),
                        child: Wrap(
                          children: icons
                              .map((e) => Obx(() {
                                    final index = icons.indexOf(e);
                                    return ChoiceChip(
                                      selectedColor: Colors.grey[200],
                                      pressElevation: 0,
                                      backgroundColor: Colors.white,
                                      label: e,
                                      selected:
                                          homeCntrl.chipIndex.value == index,
                                      onSelected: (bool selected) {
                                        homeCntrl.chipIndex.value =
                                            selected ? index : 0;
                                      },
                                    );
                                  }))
                              .toList(),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(150, 40),
                          ),
                          onPressed: () {
                            if (homeCntrl.formKey.currentState!.validate()) {
                              int icon = icons[homeCntrl.chipIndex.value]
                                  .icon!
                                  .codePoint;
                              String color = icons[homeCntrl.chipIndex.value]
                                  .color!
                                  .toHex();
                              var task = Task(
                                title: homeCntrl.editCtrl.text,
                                icon: icon,
                                color: color,
                              );
                              Get.back();
                              homeCntrl.addTask(task)
                                  ? EasyLoading.showSuccess("Create Success")
                                  : EasyLoading.showError("Error");
                            }
                          },
                          child: const Text("Confirm")),
                    ],
                  ),
                ),
              ));
          homeCntrl.editCtrl.clear();
          homeCntrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: const [8, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
