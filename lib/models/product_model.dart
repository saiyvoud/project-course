class ProductModel {
  //ຮັບຄ່າມາຈາກພາຍນອກ
  final String? productId;
  final String? name;
  final String? desc;
  final int? amout;
  final int? price;
  final String? image;

//ເອີ້ນໃຊ້ພາຍໃນ
  ProductModel({
    this.productId,
    this.name,
    this.desc,
    this.amout,
    this.price,
    this.image,
  });

//ເປັນການສ້າງ form ຂໍ້ມູນ json
  factory ProductModel.formJson(Map<String, dynamic> json) => ProductModel(
        productId: json['productId'],
        name: json['name'],
        desc: json['desc'],
        amout: json['amout'],
        price: json['price'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "desc": desc,
        "amout": amout,
        "price": price,
        "image": image,
      };
}
