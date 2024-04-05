import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab8/data/model/product.dart';
import 'package:provider/provider.dart';
import 'package:lab8/data/model/product_viewmodel.dart';
import '../../conf/const.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({Key? key}) : super(key: key);

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  var firstProductString = "";
  List<ProductModel> itemsList = [];

  @override
  void initState() {
    super.initState();
    // TODO: Implement your initialization logic here
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Danh sách hàng hóa đã chọn",
          style: TextStyle(fontSize: 24, color: Colors.amber),
        ),
        Expanded(
          child: Consumer<ProductsVM>(
            builder: (context, value, child) => Scaffold(
              body: SafeArea(
                child: Scaffold(
                  body: ListView.builder(
                    itemCount: value.items.length,
                    itemBuilder: (context, index) {
                      return itemListView(value.items[index]);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemListView(ProductModel productModel) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        children: [
          Image.asset(
            urlProductImg + productModel.img!,
            height: 80,
            width: 80,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                NumberFormat('###,###.###').format(productModel.price),
                style: const TextStyle(fontSize: 15, color: Colors.red),
              ),
              Text(
                productModel.des!,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
