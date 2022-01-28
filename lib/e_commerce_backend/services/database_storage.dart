import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_apps/e_commerce_backend/models/products_models_back.dart';

class DatabaseStorage {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return _firebaseFirestore.collection("products").snapshots().map((snap) {
      return snap.docs.map((e) => Product.fromSnapshot(e)).toList();
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
}
