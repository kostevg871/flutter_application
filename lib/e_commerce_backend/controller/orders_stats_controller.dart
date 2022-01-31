import 'package:flutter_apps/e_commerce_backend/controller/orders_starts_model.dart';
import 'package:flutter_apps/e_commerce_backend/services/database_storage.dart';
import 'package:get/get.dart';

class OrderStatsController extends GetxController {
  final DatabaseStorage databaseStorage = DatabaseStorage();

  var stats = Future.value(<OrderStats>[]).obs;

  @override
  void onInit() {
    stats.value = databaseStorage.getOrderStats();
    super.onInit();
  }
}
