import 'package:cofeeshop/config/app_theme.dart';
import 'package:flutter/material.dart';

class ProductDetailHeader extends StatelessWidget {
  String name;
  String description;

  ProductDetailHeader(this.name,this.description);

  var theme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(name,style: theme.productTitle,),
          Text(description,style: theme.productDesc,),
        ],
      ),
    );
  }
}
