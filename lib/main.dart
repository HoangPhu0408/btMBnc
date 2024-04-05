import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page/mainpage.dart';
import 'data/model/product_viewmodel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsVM(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Mainpage(),
      ),
    );
  }
}
