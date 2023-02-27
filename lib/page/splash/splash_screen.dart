import 'package:e_commerces/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

final authController = Get.put(AuthController());

@override
  void initState() {
    authController.validator();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 220),
            Center(
              child: Lottie.asset(
                'assets/animations/loading.json',
                height: 260,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text('ກຳລັງໂຫລດຂໍ້ມູນ...')
          ],
        ),
      ),
    );
  }
}
