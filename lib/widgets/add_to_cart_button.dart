import 'package:cofeeshop/state/product_detail_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddToCartButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  int quantity;
  int price;
  AddToCartButton(this.onPressed,this.quantity,this.price);

  @override
  Widget build(BuildContext context) {
    return  Provider(
      create: (_) => ProductDetailState(),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          child: MaterialButton(
            color: Theme.of(context).primaryColor,
            splashColor: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  Text(
                    "ADD ${context.watch<ProductDetailState>().quantity} TO CART",
                    style: TextStyle(color: Colors.white),
                  ),
                  buildSubtotal(context),
                ],
              ),
            ),
            onPressed: onPressed,
            shape: RoundedRectangleBorder()
          )
      ),
    );
  }

  Text buildSubtotal(BuildContext context) {
    return Text(
                  "\฿ ${(context.watch<ProductDetailState>().quantity * price) + context.watch<ProductDetailState>().extraCost}",
                  style: TextStyle(color: Colors.white),
                );
  }
}

