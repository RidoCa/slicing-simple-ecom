import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:slicing/app/modules/home/controllers/home_controller.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  final count = 0.obs;
  RxList courierList = [
    {'name': 'JNE', 'price': '20000'},
    {'name': 'JNT', 'price': '50000'},
    {'name': 'Anteraja', 'price': '100000'},
    {'name': 'POS', 'price': '70000'},
  ].obs;

  RxString invoiceNumber = '-'.obs;
  RxString courSelected = '-'.obs;
  RxString platformFee = '1000'.obs;
  RxBool confirmPayment = false.obs;

  final HomeController _homeController = Get.put(
    HomeController(),
  );

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

  String format(double n) {
    var formatter = NumberFormat('#,###,000');
    return formatter.format(n).replaceAll(',', '.');
  }

  String randomString() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  String dateNow() {
    final now = new DateTime.now();
    String formatter = DateFormat.yMMMMd('en_US').add_jm().format(now);
    return formatter;
  }

  void removeSelectedItem(data) {
    _homeController.trendsList
        .removeWhere((element) => element['name'] == data);
  }

  void increment() => count.value++;
}
