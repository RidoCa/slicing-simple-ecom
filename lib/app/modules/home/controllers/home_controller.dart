import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  RxList trendsList = [
    {
      'name': 'Puma Smash v2 L Soft Foam+',
      'image': 'assets/produk1.png',
      'price': '105000'
    },
    {
      'name': 'Nike Air Jordan Grey',
      'image': 'assets/produk2.png',
      'price': '50000'
    },
    {'name': 'Nike Colour', 'image': 'assets/produk3.png', 'price': '650000'},
    {
      'name': 'Nike Air Max 270 React',
      'image': 'assets/produk4.png',
      'price': '70000'
    },
  ].obs;

  List dummydata = [
    {
      'name': 'Puma Smash v2 L Soft Foam+',
      'image': 'assets/produk1.png',
      'price': '105000'
    },
    {
      'name': 'Nike Air Jordan Grey',
      'image': 'assets/produk2.png',
      'price': '50000'
    },
    {'name': 'Nike Colour', 'image': 'assets/produk3.png', 'price': '650000'},
    {
      'name': 'Nike Air Max 270 React',
      'image': 'assets/produk4.png',
      'price': '70000'
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void refreshData() {
    trendsList.clear();
    trendsList.value.addAll(dummydata);
  }

  String format(double n) {
    var formatter = NumberFormat('#,###,000');
    return formatter.format(n);
  }

  void increment() => count.value++;
}
