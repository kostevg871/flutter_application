import 'package:flutter_apps/e_commerce_backend/models/order_model.dart';
import 'package:flutter_apps/e_commerce_backend/services/database_storage.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final DatabaseStorage databaseStorage = DatabaseStorage();

  var orders = <Order>[].obs;
  var pendingOrders = <Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(databaseStorage.getOrders());
    pendingOrders.bindStream(databaseStorage.getPendingOrders());
    super.onInit();
  }

  void updateOrder(Order order, String field, bool value) {
    databaseStorage.updateOrder(order, field, value);
  }
}
