import 'dart:html';

import 'package:cofeeshop/config/app_theme.dart';
import 'package:cofeeshop/state/product_detail_state.dart';
import 'package:cofeeshop/utiliy/demo_data.dart';
import 'package:cofeeshop/widgets/add_to_cart_button.dart';
import 'package:cofeeshop/widgets/quantity_selector.dart';
import 'package:cofeeshop/screens/product/components/product_detail_header.dart';
import 'package:cofeeshop/screens/product/components/product_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget with ChangeNotifier {
  var item = DemoData().product1;
  int quantity = 1;
  var theme = AppTheme();



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
          else if(constraints.maxWidth > 550 && constraints.maxWidth < 1008){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: width*0.25),
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



   productDetailComponent(double width,double height,BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         Stack(
           children: [
             Container(
               // height: height*0.3,
               width: width,
               child: Image.network(
                   '${item.imgPath}',
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
                         onBackPress(context);

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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('\฿'+
                          item.price.toString(),
                          style: theme.productPrice,
                        ),
                      ),
                      QuantitySelector(item),
                    ],
                  ),
                ),
                ProductOption(item),
                AddToCartButton(quantity, item.price)
              ],
            ),
          )
        ],
      ),
    );
  }

   void onBackPress(BuildContext context) {
    Navigator.pop(context);
    Provider.of<ProductDetailState>(context, listen: false).reset();
  }

  addToCart() {
  }
}
