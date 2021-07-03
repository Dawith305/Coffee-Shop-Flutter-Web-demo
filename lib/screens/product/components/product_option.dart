import 'package:cofeeshop/models/product.dart';
import 'package:cofeeshop/state/product_detail_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOption extends StatefulWidget {
  Product item;

  ProductOption(this.item);

  @override
  _ProductOptionState createState() => _ProductOptionState();
}

class _ProductOptionState extends State<ProductOption> {
  var selectedItem;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ProductDetailState(),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  Text(widget.item.productOptionTitle,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text('(REQUIRED)',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.grey.shade300,
              child: Row(
                children: [vaildateOptions()],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: widget.item.productOptions.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: (){
                            onOptionPress(index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(child: buildOptionText(index)),
                                Radio(
                                  value: widget.item.productOptions[index].id,
                                  groupValue: selectedItem,
                                  onChanged: (_) => onOptionPress(index),
                                ),
                              ],
                            ),
                          ),
                        ),
                        widget.item.productOptions.length != (index - 1)
                            ? Divider()
                            : Container()
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void onOptionPress(int index) {
    setState(() {
      selectedItem = widget.item.productOptions[index].id;
      var extraCost = widget.item.productOptions[index].additionCost;
      context.read<ProductDetailState>().extraCost = extraCost;
    });
  }

  Widget vaildateOptions() {
    if (widget.item.extra.min >= 0) {
      context.read<ProductDetailState>().isAddToCartButtDisabled = true;
      return Text('Please select 1 item.');
    } else {
      context.read<ProductDetailState>().isAddToCartButtDisabled = false;
      return Container();
    }
  }

  Text buildOptionText(int index) {
    if (widget.item.productOptions[index].additionCost != 0)
      return Text(
          "${widget.item.productOptions[index].name}(\฿${widget.item.productOptions[index].additionCost})");
    else
      return Text("${widget.item.productOptions[index].name}");
  }
}
