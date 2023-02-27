import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 120),
            Center(
              child: Lottie.asset(
                'assets/animations/loading.json',
                height: 220,
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