import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import '../models/banner_model.dart';

class BannerController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final loadingBanner = false.obs;
  final bannerList = <BannerModel>[].obs;

  @override
  void onInit() async {
    await getBanner();
    super.onInit();
  }

  Future<void> getBanner() async {
    try {
      loadingBanner(true);
      await firestore.collection('banner').get().then((value) {
        bannerList.clear();
        for (int i = 0; i < value.docs.length; i++) {
          var data = value.docs;
          bannerList.add(BannerModel(
            name: data[i]['name'],
            desc: data[i]['desc'],
            image: data[i]['image'],
          ));
          print("=======>banner${bannerList.length}");
        }
        loadingBanner(false);
        update();
      });
    } catch (e) {
      
      rethrow;
    }
  }
}
