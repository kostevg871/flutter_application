import 'package:flutter_apps/e_commerce_backend/models/products_models_back.dart';
import 'package:flutter_apps/e_commerce_backend/services/database_storage.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final DatabaseStorage databaseStorage = DatabaseStorage();
  var products = <Product>[].obs;

  var newProduct = {}.obs;

  @override
  void onInit() {
    products.bindStream(databaseStorage.getProducts());
    super.onInit();
  }

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(
    int index,
    Product product,
    int value,
  ) {
    product.quantity = value;
    products[index] = product;
  }

  void saveNewProductPrice(Product product, String field, double value) {
    databaseStorage.updateField(product, field, value);
  }

  void saveNewProductQuantity(Product product, String field, int value) {
    databaseStorage.updateField(product, field, value);
  }
}
