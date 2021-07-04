import 'package:cofeeshop/screens/product/product_detail.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> elements = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Four", "Five", "Six", "Seven"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Shop'),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                child: Text('MENU ITEMS', style: TextStyle(fontSize: 30),),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: GridView.builder(
                  itemCount: elements.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 130.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ProductDetail();
                            });
                      },
                      child: Card(
                        child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(8.0), child: Text(elements[i])
                            )
                        )
                  ),
                    );
                  }
              )
            ),
          ],
        ),
      ),
    );
  }
}



