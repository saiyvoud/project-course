import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerces/components/color.dart';
import 'package:e_commerces/components/data.dart';
import 'package:flutter/cupertino.dart';

class BarnnerComponents extends StatefulWidget {
  const BarnnerComponents({super.key});

  @override
  State<BarnnerComponents> createState() => _BarnnerComponentsState();
}

class _BarnnerComponentsState extends State<BarnnerComponents> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _barnner(),
        // SizedBox(
        //   height: 10,
        // ),
        _indicator(),
      ],
    );
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
        // aspectRatio: 1,
        viewportFraction: 1,
      ),
      items: barnner.map((e) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              e,
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
        children: barnner.map((e) {
          var index = barnner.indexOf(e);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
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
