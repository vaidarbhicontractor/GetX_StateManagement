import 'package:get/get.dart';
import 'package:getstate/model/product.dart';

class ShoppingController extends GetxController {
  var products = List<Product>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResults = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'Some Description',
          productImage: 'abc',
          productName: 'First'),
      Product(
          id: 2,
          price: 45,
          productDescription: 'Some Description',
          productImage: 'def',
          productName: 'Second'),
      Product(
          id: 3,
          price: 60,
          productDescription: 'Some Description',
          productImage: 'ghi',
          productName: 'Third'),
    ];
    products.value = productResults;
  }
}
