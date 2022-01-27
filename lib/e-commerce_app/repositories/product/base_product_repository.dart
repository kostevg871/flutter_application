import 'package:flutter_apps/e-commerce_app/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProduct();
}
