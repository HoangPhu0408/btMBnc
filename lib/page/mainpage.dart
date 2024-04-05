import 'package:flutter/material.dart';
import 'package:lab8/page/homewidget.dart';
import 'package:lab8/page/product/productlist.dart';
import 'package:lab8/page/product/productcart.dart';
import 'package:provider/provider.dart';
import '../data/model/product_viewmodel.dart';
import '../data/model/cartcounter.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    ProductList(),
    ProductCart(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
        actions: [
          InkWell(
            onTap: () {
              // Chuyển về tab 2: Product
              _onItemTapped(2);
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(Icons.shopping_bag, size: 24),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Consumer<ProductsVM>(
                      builder: (context, value, child) => CartCounter(
                        count: value.items.length.toString(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(34, 150, 243, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
