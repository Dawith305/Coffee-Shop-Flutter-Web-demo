import 'package:cofeeshop/config/app_theme.dart';
import 'package:cofeeshop/state/product_detail_state.dart';
import 'package:cofeeshop/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatefulWidget {
  int quantity;
  int price;

  AddToCartButton(this.quantity, this.price);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  var theme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ProductDetailState(),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          child: MaterialButton(
              color: theme.cartButtonColor,
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
                      style: theme.cartButtonFont,
                    ),
                    buildSubtotal(context),
                  ],
                ),
              ),
              onPressed: () => addToCart(context),
              shape: RoundedRectangleBorder())),
    );
  }

  Text buildSubtotal(BuildContext context) {
    return Text(
      "\฿ ${(context.watch<ProductDetailState>().quantity * widget.price) + context.watch<ProductDetailState>().extraCost}",
      style: theme.cartButtonFont,
    );
  }

  addToCart(BuildContext context) {
    return ToastWidget(
            'Item added to cart', Toast.LENGTH_SHORT)
        .buildToaster(context);
    ;
  }
}
