import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  Toast length;
  var message;

  ToastWidget(this.message, this.length);


  buildToaster(context) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}

