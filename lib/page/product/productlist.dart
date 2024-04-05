import 'package:flutter/material.dart';
import 'package:lab8/conf/const.dart';
import '../../data/model/product.dart';
import '../../data/data/productdata.dart';
import 'productbody.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<ProductModel> firstProducts = [];

  Future<void> loadProdList() async {
    firstProducts.addAll(await ReadData().loadData());
  }

  @override
  void initState() {
    super.initState();
    loadProdList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<void>(
          future: loadProdList(),
          builder: (context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return GridView.builder(
                itemCount: firstProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return itemGridView(firstProducts[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
