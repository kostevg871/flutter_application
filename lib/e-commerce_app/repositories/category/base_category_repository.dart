import 'package:flutter_apps/e-commerce_app/models/category_models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
