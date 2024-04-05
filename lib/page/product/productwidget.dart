import 'package:flutter/material.dart';
import 'package:phantrongdai_21dh113217_buoi5/data/model/categorymodel.dart';
import 'package:phantrongdai_21dh113217_buoi5/data/model/productmodel.dart';
import '../../data/provider/productprovider.dart';
import 'productbody.dart';
import '../../conf/const.dart';

class ProductWidget extends StatefulWidget {
  final Category objCat;

  const ProductWidget({Key? key, required this.objCat}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<Product> _lstProduct = [];

  Future<String> loadProdList(int catId) async {
    _lstProduct = await ReadData().loadDataByCat(catId) as List<Product>;
    return '';
  }

  @override
  void initState() {
    super.initState();
    loadProdList(widget.objCat.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product list ${widget.objCat.name.toString().toUpperCase()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: loadProdList(widget.objCat.id!),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return GridView.builder(
              itemCount: _lstProduct.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 4,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return itemGridView(_lstProduct[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
