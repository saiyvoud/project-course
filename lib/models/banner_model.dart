class BannerModel {
  //ຮັບຄ່າມາຈາກພາຍນອກ
  final String? name;
  final String? desc;
  final String? image;

//ເອີ້ນໃຊ້ພາຍໃນ
  BannerModel({
    this.name,
    this.desc,
    this.image,
  });

//ເປັນການສ້າງ form ຂໍ້ມູນ json
  factory BannerModel.formJson(Map<String, dynamic> json) => BannerModel(
        name: json['name'],
        desc: json['desc'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "image": image,
      };
}
