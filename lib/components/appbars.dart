import 'package:e_commerces/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color.dart';

AppBar appbar(BuildContext context, AuthController controller) {
  return AppBar(
    backgroundColor: primaryColor,
    leading: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: primaryColorWhite, borderRadius: BorderRadius.circular(50)),
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
      GetBuilder(builder: <CartController>(cartController) {
        if (cartController.loadingCart.value) {
          return CircularProgressIndicator();
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Positioned(
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
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          );
        }
      }),
      IconButton(
        onPressed: () {
          controller.logout();
        },
        icon: Icon(Icons.exit_to_app),
      )
    ],
  );
}
