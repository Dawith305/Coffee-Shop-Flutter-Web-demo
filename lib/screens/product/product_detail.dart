import 'dart:html';

import 'package:cofeeshop/config/demo_data.dart';
import 'package:cofeeshop/widgets/add_to_cart_button.dart';
import 'package:cofeeshop/widgets/quantity_selector.dart';
import 'package:cofeeshop/screens/product/components/product_detail_header.dart';
import 'package:cofeeshop/screens/product/components/product_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget with ChangeNotifier {
  var item = DemoData().product1;
  int quantity = 1;



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
        builder:(context,constraints){

          if(constraints.maxWidth > 1008){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: width*0.3),
              child: Card(child: productDetailComponent(width,height,context)),
            );
          }
          else if(constraints.maxWidth > 640 && constraints.maxWidth < 1008){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: width*0.3),
              child: Card(child: productDetailComponent(width,height,context)),
            );
          }
          else{
            return Container(
              margin: EdgeInsets.symmetric(horizontal: width*0.0005),
              child: Card(child: productDetailComponent(width,height,context)),
            );
          }


        }
    );
  }



  SingleChildScrollView productDetailComponent(double width,double height,BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         Stack(
           children: [
             Container(
               // height: height*0.3,
               width: width,
               child: Image.asset(
                   '/images/${item.imgPath}',
                    height: height*0.4,
                    fit: BoxFit.cover,
               ),
             ),
             Container(
               margin: EdgeInsets.all(5),
               child: Align(
                 alignment: Alignment.topLeft,
                 child: CircleAvatar(
                   backgroundColor: Colors.white,
                   child: IconButton(
                       icon: Icon(Icons.arrow_back_rounded,),
                       onPressed: () {
                         Navigator.pop(context);
                       }),
                 ),
               ),
             ),
           ],
         ),
          //Description
          Container(
            // margin: EdgeInsets.all(10),
            child: Column(
              children: [
                //Product Header
                ProductDetailHeader(item.name, item.description),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\฿'+
                        item.price.toString(),
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),
                      ),
                      QuantitySelector(item),
                    ],
                  ),
                ),
                ProductOption(item),
                AddToCartButton(addToCart, quantity, item.price)
              ],
            ),
          )
        ],
      ),
    );
  }

  addToCart() {

  }
}
