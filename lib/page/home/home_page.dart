import 'package:e_commerces/components/barnner.dart';
import 'package:e_commerces/components/color.dart';
import 'package:e_commerces/components/loading.dart';
import 'package:e_commerces/components/menu.dart';
import 'package:e_commerces/components/product.dart';
import 'package:e_commerces/controller/auth_controller.dart';
import 'package:e_commerces/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authController = Get.put(AuthController());
  final productController = Get.put(ProductController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.loading.value) {
        return Loading();
      } else {
        
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: primaryColorWhite,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
              ),
            ),
            // centerTitle: true,
            title: Text(
              "Auto Part Shopee",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    GetBuilder<CartController>(builder: (context) {
                      if (cartController.loadingCart.value) {
                        return CircularProgressIndicator();
                      } else {
                        return Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: primaryColorRed,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              "${cartController.cartModelList.length}",
                            )),
                          ),
                        );
                      }
                    }),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  authController.logout();
                },
                icon: Icon(Icons.exit_to_app),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                BarnnerComponents(),
                MenuComponent(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Product Recommand",
                  style: TextStyle(
                      color: primaryColorBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                ProductComponent()
              ],
            ),
          ),
        );
      }
    });
  }
}
