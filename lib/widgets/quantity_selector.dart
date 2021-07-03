import 'package:cofeeshop/config/app_theme.dart';
import 'package:cofeeshop/models/product.dart';
import 'package:cofeeshop/state/product_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantitySelector extends StatefulWidget {
  Product item;

  QuantitySelector(this.item);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {

  //default = 1
  int quantity = 1;
  var theme = AppTheme();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ProductDetailState(),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle),
              color: Theme.of(context).accentColor,
              onPressed: (){
                setState(() {
                  //subtract if greater than 2
                  if(context.read<ProductDetailState>().quantity >= 2) {
                    context.read<ProductDetailState>().decreaseQuantity();
                  }
                });
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Text(context.read<ProductDetailState>().quantity.toString(),style: theme.productQuantity,),
            ),
            IconButton(
              icon: Icon(Icons.add_circle),
              color: Theme.of(context).primaryColor,
              onPressed: (){
                setState(() {
                  //increase item
                  context.read<ProductDetailState>().addQuantity();
                });
              },

            ),
          ],
        ),
      ),
    );
  }
}
