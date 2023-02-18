import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey _dropdownButtonKey = new GlobalKey();
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Status pengiriman",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // img info
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            height: 157,
                            controller.confirmPayment.value == true
                                ? 'assets/pengiriman.png'
                                : 'assets/blmdibayar.png',
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Status : ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            controller.confirmPayment.value == true
                                ? "Dalam perjalanan"
                                : "Menunggu pembayaran",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // column info shipment
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tanggal transaksi",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        controller.confirmPayment.value == true
                            ? controller.dateNow()
                            : "-",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kurir pengiriman",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.courSelected.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.confirmPayment.value ==
                                    false
                                ? Get.bottomSheet(
                                    Column(
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ListView.builder(
                                              itemCount:
                                                  controller.courierList.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    controller.courSelected
                                                        .value = controller
                                                            .courierList
                                                            .elementAt(
                                                                index)['name'] +
                                                        ' - Rp.' +
                                                        controller.format(
                                                            double.parse(
                                                          controller.courierList
                                                              .elementAt(index)[
                                                                  'price']
                                                              .toString(),
                                                        ));

                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              controller
                                                                      .courierList
                                                                      .elementAt(
                                                                          index)[
                                                                  'name'],
                                                            ),
                                                            Text(
                                                              'Rp. ${controller.format(double.parse(controller.courierList.elementAt(index)['price']))}',
                                                            ),
                                                          ],
                                                        ),
                                                        const Divider(
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )
                                : SizedBox(),
                            child: controller.confirmPayment.value == false
                                ? Text(
                                    controller.courSelected.value == '-'
                                        ? 'Pilih Kurir'
                                        : 'Ganti Kurir',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1A87EB),
                                    ),
                                  )
                                : Text("Dikirim",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    )),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nomor resi",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        controller.confirmPayment.value == true
                            ? controller.randomString()
                            : "-",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  // tag invoice
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Invoice",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "#${controller.randomString()}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    thickness: 6,
                  ),
                  // img product
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              height: 157,
                              data['image'].toString(),
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            data['name'].toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 25,
                                  ),
                                  child: Text(
                                    'Rp. ${controller.format(double.parse(data['price']))}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF212121),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '500gr',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // summary cart
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    thickness: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          "Ringkasan",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      // price etc
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Harga produk",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Rp. ${controller.format(double.parse(data['price']))}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Platform fee",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Rp. ${controller.format(
                                  double.parse(controller.platformFee.value),
                                ).toString()}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ongkos kirim",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            controller.courSelected.value == '-'
                                ? '-'
                                : 'Rp. ${controller.format(
                                    double.parse(
                                      controller.courSelected
                                          .split('Rp.')[1]
                                          .replaceAll(",", ""),
                                    ),
                                  )}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      // total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            controller.courSelected.value == '-'
                                ? 'Rp. ${controller.format(double.parse(data['price']) + 1000)}'
                                : 'Rp. ${controller.format(
                                    double.parse(data['price']) +
                                        double.parse(
                                          controller.courSelected
                                              .split('Rp.')[1]
                                              .replaceAll(",", ""),
                                        ) +
                                        1000,
                                  )}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: 20,
                        ),
                        child: Text(
                          "Segera lakukan pembayaran",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      controller.confirmPayment.value
                          ? const SizedBox(
                              height: 50,
                              child: Text(
                                "Terima kasih telah melakukan pembelian barang, barang anda sedang dikirim ke tempat anda,",
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                bottom: 20,
                              ),
                              width: Get.size.width,
                              child: ElevatedButton(
                                child: Text(
                                    "Konfirmasi pembayaran".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      controller.courSelected.value == '-'
                                          ? MaterialStateProperty.all<Color>(
                                              Colors.grey)
                                          : MaterialStateProperty.all<Color>(
                                              Colors.blue,
                                            ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                onPressed: () => Get.defaultDialog(
                                  title: "Konfirmasi",
                                  titleStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  textConfirm: "Setuju",
                                  textCancel: "Batal",
                                  cancelTextColor: Colors.black,
                                  confirmTextColor: Colors.white,
                                  buttonColor: Colors.blue,
                                  barrierDismissible: false,
                                  onConfirm: () {
                                    controller.confirmPayment.value = true;
                                    controller.removeSelectedItem(
                                      data['name'].toString(),
                                    );
                                    Get.back();
                                  },
                                  content: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: const Text(
                                          "Apakah anda yakin ingin melanjutkan proses pembayaran?",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
