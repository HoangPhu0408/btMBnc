import 'package:lab8/data/model/product.dart';
import 'dart:convert';
import "package:flutter/services.dart";

class ReadData {
  Future<List<ProductModel>> loadData() async {
    var data = await rootBundle.loadString("assets/files/productlist.json");
    var dataJson = jsonDecode(data);

    return (dataJson["data"] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
