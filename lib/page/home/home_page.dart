import 'dart:ui';

import 'package:e_commerces/components/barnner.dart';
import 'package:e_commerces/components/color.dart';
import 'package:e_commerces/components/menu.dart';
import 'package:e_commerces/components/product.dart';
import 'package:flutter/material.dart';

import '../../components/appbars.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
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
}
