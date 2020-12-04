import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstate/controller/cart_controller.dart';
import 'package:getstate/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12.0),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      '${controller.products[index].productDescription}',
                                    ),
                                  ],
                                ),
                                Text(
                                  '${controller.products[index].price}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              color: Colors.black,
                              textColor: Colors.white,
                              child: Text('Add To Cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total Amount: \$ ${controller.totalPrice}',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                );
              },
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.black,
          ),
          label: GetX<CartController>(
            builder: (controller) {
              return Text(
                controller.count.toString(),
                style: TextStyle(color: Colors.black, fontSize: 20),
              );
            },
          )),
    );
  }
}
