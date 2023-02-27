import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerces/components/color.dart';
import 'package:e_commerces/components/data.dart';
import 'package:e_commerces/controller/banner_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarnnerComponents extends StatefulWidget {
  const BarnnerComponents({super.key});

  @override
  State<BarnnerComponents> createState() => _BarnnerComponentsState();
}

class _BarnnerComponentsState extends State<BarnnerComponents> {
  final bannerController = Get.put(BannerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (context) {
      if (bannerController.loadingBanner.value) {
        return CircularProgressIndicator();
      } else {
        return Stack(
          children: [
            _barnner(),
            _indicator(),
          ],
        );
      }
    });
  }

  int _current = 0;

  _barnner() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 170,
        onPageChanged: ((index, reason) {
          setState(() {
            _current = index;
          });
        }),
        viewportFraction: 1,
      ),
      items: bannerController.bannerList.map((e) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              e.image!,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }

  _indicator() {
    return Positioned(
      top: 145,
      right: 50,
      left: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: bannerController.bannerList.map((e) {
          var index = bannerController.bannerList.indexOf(e);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: primaryColorWhite,
              shape: _current == index ? BoxShape.circle : BoxShape.circle,
            ),
            height: _current == index ? 10 : 5,
            width: 8,
          );
        }).toList(),
      ),
    );
  }
}
