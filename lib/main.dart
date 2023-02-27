import 'package:e_commerces/controller/auth_controller.dart';
import 'package:e_commerces/controller/product_controller.dart';
import 'package:e_commerces/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/banner_controller.dart';
import 'controller/cart_controller.dart';

void main() async {
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => ProductController());
  Get.lazyPut(() => CartController());
  Get.lazyPut(() => BannerController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: routes(),
    );
  }
}
