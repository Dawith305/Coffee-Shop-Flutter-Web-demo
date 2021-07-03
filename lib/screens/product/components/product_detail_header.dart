import 'package:flutter/material.dart';

class ProductDetailHeader extends StatelessWidget {
  String name;
  String description;

  ProductDetailHeader(this.name,this.description);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
          Text(description,style: TextStyle(fontSize: 12,color: Colors.grey ),),
        ],
      ),
    );
  }
}
