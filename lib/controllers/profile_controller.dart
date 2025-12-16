import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class ProfileController extends GetxController {
  var name = 'Karthik B'.obs;
  var email = 'karthik@gmail.com'.obs;
  var phone = '+91 9876543210'.obs;
  var address = '2-3-155 ,Premnagar,Amberpet, Hyderabad, 500013'.obs;

  var orders = [
    'Order #10010090 - ₹499 - Delivered',
    'Order #10056790 - ₹1299-  Delivered',
    'Order #10190876 - ₹299 - Pending',
    'Order #10300989 - ₹799 - Delivered',
  ].obs;

  void logout() {
    debugPrint('User logged out');
  }
}
