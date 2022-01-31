import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_apps/e_commerce_backend/controller/orders_starts_model.dart';
import 'package:flutter_apps/e_commerce_backend/models/order_model.dart';
import 'package:flutter_apps/e_commerce_backend/models/products_models_back.dart';

class DatabaseStorage {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<OrderStats>> getOrderStats() {
    return _firebaseFirestore
        .collection("orders_stats")
        .orderBy("dateTime")
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((e) => OrderStats.fromSnapshot(e.value, e.key))
            .toList());
  }

  Stream<List<Product>> getProducts() {
    return _firebaseFirestore.collection("products").snapshots().map((snap) {
      return snap.docs.map((e) => Product.fromSnapshot(e)).toList();
    });
  }

  Stream<List<Order>> getPendingOrders() {
    return _firebaseFirestore
        .collection("orders")
        .where("isDelivered", isEqualTo: false)
        .where("isCanceled", isEqualTo: false)
        .snapshots()
        .map((snap) {
      return snap.docs.map((e) => Order.fromSnapshot(e)).toList();
    });
  }

  Future<void> addProduct(Product product) {
    return _firebaseFirestore.collection("products").add(product.toMap());
  }

  Future<void> updateField(Product product, String field, dynamic newValue) {
    return _firebaseFirestore
        .collection("products")
        .where('id', isEqualTo: product.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }

  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection("orders").snapshots().map((snap) {
      return snap.docs.map((e) => Order.fromSnapshot(e)).toList();
    });
  }

  Future<void> updateOrder(Order order, String field, dynamic newValue) {
    return _firebaseFirestore
        .collection("orders")
        .where('id', isEqualTo: order.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }
}
