import 'package:flutter/material.dart';
import 'package:lab2/data/model.dart';
import '../data/data.dart';
import 'package:intl/intl.dart';
import '../config/const.dart';

class MyGrid extends StatefulWidget {
  const MyGrid({super.key});

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  List<ProductModel> lstProduct = [];

  @override
  void initState() {
    super.initState();
    lstProduct = createDataList(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Grid Product: UR name"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: GridView.builder(
            itemCount: lstProduct.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              return itemGridView(lstProduct[index]);
            }),
      ),
    );
  }

  Widget itemGridView(ProductModel productModel) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset(
          url_img + productModel.img!,
          height: 80,
          width: 80,
          errorBuilder: (context, error, StackTrace) => const Icon(Icons.image),
        ),
        Text(
          NumberFormat('Price: ###,###.###').format(productModel.price),
          style: const TextStyle(fontSize: 15, color: Colors.red),
        ),
        Text(
          productModel.des!,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        )
      ]),
    );
  }
}
