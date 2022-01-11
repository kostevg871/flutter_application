import 'package:flutter/material.dart';
import 'package:flutter_apps/todo_app_getx/app/data/services/storage/services.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/binding.dart';
import 'package:flutter_apps/todo_app_getx/app/modules/home/view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const TodoAppMain());
}

class TodoAppMain extends StatelessWidget {
  const TodoAppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo List",
      home: const HomeView(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
