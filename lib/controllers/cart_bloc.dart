import 'package:get/get.dart';

class CartBloc extends GetxController {
  var totalItemsInCart = 0.obs;

  void addItemToCart() {
    totalItemsInCart.value++;
  }
}
