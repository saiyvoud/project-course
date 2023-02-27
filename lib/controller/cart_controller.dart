import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerces/components/color.dart';
import 'package:e_commerces/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final List cartList = [];
  final loadingCart = false.obs;
  final cartModelList = <CartModel>[].obs;
  var totalPrice = 0.obs;
  @override
  void onInit() async {
    await getCart();
    super.onInit();
  }

  Future<void> removeAmountCart({required String id}) async {
    try {
      loadingCart(true);

      await firestore.collection('cart').doc(id).get().then((result) {
        firestore.collection('cart').doc(id).update({
          'amout': result['amout'] - 1,
        }).then((value) async {
          await getCart();
          Get.snackbar(
            "remove Cart",
            "remove amount in cart succesful!",
            colorText: primaryColorWhite,
            backgroundColor: primaryColorAmber,
          );
          loadingCart(false);
          update();
        });
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCart({required String id}) async {
    try {
      loadingCart(true);

      await firestore.collection('cart').doc(id).get().then((result) {
        firestore.collection('cart').doc(id).delete().then((value) async {
          await getCart();
          Get.snackbar(
            "delete Cart",
            "delete cart succesful!",
            colorText: primaryColorWhite,
            backgroundColor: primaryColorRed,
          );
          loadingCart(false);
          update();
        });
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addAmountToCart({required String id}) async {
    try {
      loadingCart(true);

      await firestore.collection('cart').doc(id).get().then((result) {
        firestore.collection('cart').doc(id).update({
          'amout': result['amout'] + 1,
        }).then((value) async {
          await getCart();
          Get.snackbar(
            "add Cart",
            "add amount in cart succesful!",
            colorText: primaryColorWhite,
            backgroundColor: primaryColorGreen,
          );
          loadingCart(false);
          update();
        });
      });
    } catch (e) {
      rethrow;
    }
  }


  Future<void> getCart() async {
    try {
      loadingCart(true);
      await firestore
          .collection('cart')
          .where("userId", isEqualTo: auth.currentUser!.uid)
          .get()
          .then((value) {
        cartModelList.clear();
        totalPrice(0);
        for (int i = 0; i < value.docs.length; i++) {
          var data = value.docs;

          cartModelList.add(CartModel(
            productId: data[i].id,
            name: data[i]['name'],
            desc: data[i]['desc'],
            amout: data[i]['amout'],
            price: data[i]['price'],
            image: data[i]['image'],
            userId: data[i]['userId'],
          ));
          print("=======>${cartModelList.length}");
          totalPrice += data[i]['amout'] * data[i]['price'];
        }
        loadingCart(false);
        update();
      });
    } catch (e) {
      loadingCart(false);
      update();
      rethrow;
    }
  }

  Future<void> addProductToCart({
    required String productId,
    required String name,
    required String desc,
    required int amout,
    required int price,
    required String image,
  }) async {
    try {
      await firestore
          .collection('cart')
          .where("userId", isEqualTo: auth.currentUser!.uid)
          .get()
          .then((value) {
        for (var element in value.docs) {
          cartList.add(element.id);
        }
        if (cartList.contains(productId)) {
          firestore.collection('cart').doc(productId).get().then((value) {
            firestore.collection('cart').doc(productId).update({
              "amout": value.data()!['amout'] + 1,
            }).then((value) {
              Get.snackbar(
                "update Cart",
                "update product to cart succesful!",
                colorText: primaryColorWhite,
                backgroundColor: primaryColorAmber,
              );
            });
          });
        } else {
          firestore.collection("cart").doc(productId).set({
            "productId": productId,
            "name": name,
            "desc": desc,
            "amout": amout,
            "price": price,
            "image": image,
            "userId": auth.currentUser!.uid,
          }).then((value) async {
            Get.snackbar(
              "add Cart",
              "add product to cart succesful!",
              colorText: primaryColorWhite,
              backgroundColor: primaryColorGreen,
            );
            await getCart();
          });
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}
