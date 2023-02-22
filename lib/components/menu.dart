import 'package:e_commerces/components/data.dart';
import 'package:flutter/material.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                '${menu[index]['img']}',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${menu[index]['name']}",
                style: TextStyle(fontSize: 10),
              )
            ],
          );
        },
      ),
    );
  }
}
