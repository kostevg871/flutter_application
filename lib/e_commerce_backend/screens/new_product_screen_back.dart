import 'package:flutter/material.dart';
import 'package:flutter_apps/e_commerce_backend/controller/product_controller.dart';
import 'package:flutter_apps/e_commerce_backend/models/products_models_back.dart';
import 'package:flutter_apps/e_commerce_backend/services/database_storage.dart';
import 'package:flutter_apps/e_commerce_backend/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductScreenBack extends StatelessWidget {
  NewProductScreenBack({Key? key}) : super(key: key);

  final ProductController productController = Get.find();

  StorageService storage = StorageService();
  DatabaseStorage database = DatabaseStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Add a Product"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.black,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            ImagePicker _picker = ImagePicker();
                            final XFile? _image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            if (_image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("No image was selected")));
                            }
                            if (_image != null) {
                              await storage.uploadImage(_image);
                              var imageUrl =
                                  await storage.getDownloadURL(_image.name);

                              productController.newProduct.update(
                                  "imageUrl", (_) => imageUrl,
                                  ifAbsent: () => imageUrl);
                              print(productController.newProduct['imageUrl']);
                            }
                          },
                          icon: Icon(Icons.add_circle, color: Colors.white),
                        ),
                        Text(
                          "Add an new Image",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Product Information",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _buildTextFormField("Product ID", 'id', productController),
                _buildTextFormField("Product Name", 'name', productController),
                _buildTextFormField(
                    "Product Description", 'description', productController),
                _buildTextFormField(
                    "Product Category", 'category', productController),
                const SizedBox(height: 10),
                buildSlideNewProduct("Price", "price", productController,
                    productController.price),
                buildSlideNewProduct("Quantity", "quantity", productController,
                    productController.quantity),
                const SizedBox(height: 10),
                buildCheckBox("Recommended", 'isRecommended', productController,
                    productController.isRecommended),
                buildCheckBox("Popular", "isPopular", productController,
                    productController.isPopular),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      database.addProduct(Product(
                          id: int.parse(productController.newProduct['id']),
                          name: productController.newProduct['name'],
                          category: productController.newProduct['category'],
                          description:
                              productController.newProduct['description'],
                          imageUrl: productController.newProduct['imageUrl'],
                          isRecommended:
                              productController.newProduct['isRecommended'],
                          isPopular: productController.newProduct['isPopular'],
                          price: productController.newProduct['price'],
                          quantity: productController.newProduct['quantity']
                              .toInt()));
                      print(productController.newProduct);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text("Save",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Row buildCheckBox(String title, String name,
      ProductController productController, bool? controllerValue) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {
            productController.newProduct
                .update(name, (_) => value, ifAbsent: () => value);
          },
        ),
      ],
    );
  }

  Row buildSlideNewProduct(String title, String name, ProductController product,
      double? controllerValue) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: SizedBox(
            width: 150,
            child: Slider(
                value: (controllerValue == null) ? 0 : controllerValue,
                min: 0,
                max: 25,
                divisions: 10,
                activeColor: Colors.black,
                inactiveColor: Colors.black12,
                onChanged: (value) {
                  productController.newProduct
                      .update(name, (_) => value, ifAbsent: () => value);
                }),
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
      String hintText, String name, ProductController productController) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct
            .update(name, (_) => value, ifAbsent: () => value);
      },
    );
  }
}
