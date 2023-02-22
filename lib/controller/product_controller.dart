import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerces/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final loading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await getProduct();
    super.onInit();
  }

  final productList = <ProductModel>[].obs; //RnX

  Future<void> getProduct() async {
    try {
      loading(true);
      await firestore.collection("product").get().then((value) {
        for (int i = 0; i < value.docs.length; i++) {
          productList.add(
            ProductModel(
              productId: value.docs[i].id,
              amout: value.docs[i]['amout'],
              desc: value.docs[i]['desc'],
              image: value.docs[i]['image'],
              name: value.docs[i]['name'],
              price: value.docs[i]['price'],
            ),
          );
          loading(false);
          update();
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}
