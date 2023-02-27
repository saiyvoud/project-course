import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerces/components/color.dart';
import 'package:e_commerces/controller/product_controller.dart';
import 'package:e_commerces/page/home/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ProductComponent extends StatefulWidget {
  const ProductComponent({super.key});

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (productController.loading.value) {
          return CircularProgressIndicator(
            color: primaryColor,
          );
        }
        return GridView.builder(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // crossAxisSpacing: 0.8,
            childAspectRatio: 0.8,
          ),
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            var data = productController.productList;
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailHomePage(productModel: data[index]))),
              child: Card(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: '${data[index].image}',
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${data[index].name}')
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
