import 'package:e_commerces/components/color.dart';
import 'package:e_commerces/components/loading.dart';
import 'package:e_commerces/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.loadingCart.value) {
        return Loading();
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: primaryColorWhite,
              ),
            ),
            title: Text('Cart Page'),
            centerTitle: true,
          ),
          body: cartController.cartModelList.length == 0
              ? Container(
                  margin: EdgeInsets.all(120),
                  child: Center(
                      child: Text(
                    "ຍັງບໍ່ມີຂໍ້ມູນ!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColorGrey,
                    ),
                  )),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: cartController.cartModelList.length,
                  itemBuilder: (context, index) {
                    var data = cartController.cartModelList;
                    return Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.network(
                              data[index].image!,
                              fit: BoxFit.cover,
                              height: 130,
                              width: 130,
                            ),
                          ),
                          Container(
                            height: 140,
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].name!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: primaryColorBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  data[index].desc!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: primaryColorGrey,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  data[index].price.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColorRed,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: ()=> cartController.removeAmountCart(id: data[index].productId!),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: primaryColorAmber,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          color: primaryColorWhite,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GetBuilder<CartController>(
                                      builder: (context) {
                                        return Text(
                                          data[index].amout.toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: primaryColorBlack,
                                          ),
                                        );
                                      }
                                    ),
                                    SizedBox(width: 10),
                                    InkWell(
                                      onTap: ()=> cartController.addAmountToCart(id: data[index].productId!),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: primaryColorGreen,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: primaryColorWhite,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          cartController.deleteCart(id: data[index].productId!);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: primaryColorRed,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
          bottomNavigationBar: cartController.cartModelList.length == 0
              ? SizedBox()
              : Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        GetBuilder<CartController>(
                          builder: (context) {
                            return Text(
                              "ລາຄາ: ${cartController.totalPrice.toString()} Kip",
                              style: TextStyle(
                                fontSize: 18,
                                color: primaryColorWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        ),
                        Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                            color: primaryColorWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'ຊຳລະເງີນ',
                              style: TextStyle(
                                fontSize: 18,
                                color: primaryColorBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      }
    });
  }
}
