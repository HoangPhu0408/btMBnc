class ProductModel {
  int? id;
  String? name;
  String? img;
  int? price;
  int? catId;
  String? des;
  //constructor
  String? catName;

  ProductModel(
      {this.id,
      this.price,
      this.name,
      this.des,
      this.img,
      this.catId,
      this.catName});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    name = json["name"];
    des = json["des"];
    img = json["img"];
    catName = json["catName"];
    catId = json["catId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["price"] = price;
    data["name"] = name;
    data["des"] = des;
    data["img"] = img;
    data["catName"] = catName;
    data["catId"] = catId;
    return data;
  }
}
