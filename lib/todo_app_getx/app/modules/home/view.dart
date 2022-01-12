import 'package:flutter/material.dart';
import 'package:flutter_apps/todo_app_getx/app/core/utils/extansions.dart';
import 'package:flutter_apps/todo_app_getx/app/data/models/task.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/controller.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/widgets/add_card.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/widgets/task_card.dart';
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
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  TaskCard(
                      task: Task(
                          title: "title", icon: 0xe59c, color: "#FF2B60E6")),
                  AddCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
