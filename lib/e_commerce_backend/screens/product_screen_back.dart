import 'package:flutter/material.dart';
import 'package:flutter_apps/e_commerce_backend/controller/product_controller.dart';
import 'package:flutter_apps/e_commerce_backend/models/products_models_back.dart';
import 'package:flutter_apps/e_commerce_backend/screens/new_product_screen_back.dart';
import 'package:get/get.dart';

class ProductScreenBack extends StatelessWidget {
  ProductScreenBack({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => NewProductScreenBack());
                      },
                      icon: Icon(Icons.add_circle, color: Colors.white),
                    ),
                    Text(
                      "Add a new product",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => SizedBox(
                        height: 210,
                        child: ProductCardBack(
                          product: productController.products[index],
                          index: index,
                        ),
                      ),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}

class ProductCardBack extends StatelessWidget {
  final Product product;
  final int index;
  ProductCardBack({Key? key, required this.product, required this.index})
      : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Slider(
                                value: product.price,
                                min: 0,
                                max: 25,
                                divisions: 10,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black12,
                                onChangeEnd: (value) {
                                  productController.saveNewProductPrice(
                                      product, "price", value);
                                },
                                onChanged: (value) {
                                  productController.updateProductPrice(
                                      index, product, value);
                                }),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              "\$${product.price.toStringAsFixed(1)}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text(
                              "Qty.",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Slider(
                                value: product.quantity.toDouble(),
                                min: 0,
                                max: 100,
                                divisions: 10,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black12,
                                onChangeEnd: (value) {
                                  productController.saveNewProductQuantity(
                                      product, "quantity", value.toInt());
                                },
                                onChanged: (value) {
                                  productController.updateProductQuantity(
                                      index, product, value.toInt());
                                }),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              "${product.quantity.toInt()}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
