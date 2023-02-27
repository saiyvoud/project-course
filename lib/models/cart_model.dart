class CartModel {
  //ຮັບຄ່າມາຈາກພາຍນອກ
  final String? productId;
  final String? name;
  final String? desc;
  final int? amout;
  final int? price;
  final String? image;
  final String? userId;
//ເອີ້ນໃຊ້ພາຍໃນ
  CartModel({
    this.productId,
    this.name,
    this.desc,
    this.amout,
    this.price,
    this.image,
    this.userId,
  });

//ເປັນການສ້າງ form ຂໍ້ມູນ json
  factory CartModel.formJson(Map<String, dynamic> json) => CartModel(
        productId: json['productId'],
        name: json['name'],
        desc: json['desc'],
        amout: json['amout'],
        price: json['price'],
        image: json['image'],
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "desc": desc,
        "amout": amout,
        "price": price,
        "image": image,
        "userId": userId,
      };
}
