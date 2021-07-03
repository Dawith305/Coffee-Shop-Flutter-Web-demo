import 'package:cofeeshop/screens/product/product_detail.dart';
import 'package:cofeeshop/screens/product/product_list.dart';
import 'package:cofeeshop/state/product_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      //Registering the product modal detail
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductDetailState(),),
        ],
        child: const Home(),
      )
  );
  }

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}
