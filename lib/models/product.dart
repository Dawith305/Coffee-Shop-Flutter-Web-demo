import 'package:cofeeshop/models/option.dart';

import 'extra.dart';

class Product {
  int _id;
  String _name;
  String _description;
  int _price;
  String _imgPath;
  String _productOptionTitle;
  List<Option> _productOptions;
  Extra _extra;


  Product(this._id,this._name, this._description, this._price,this._imgPath,this._productOptionTitle,this._productOptions,this._extra);

  //Empty Constructor






  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get imgPath => _imgPath;

  set imgPath(String value) {
    _imgPath = value;
  }

  String get productOptionTitle => _productOptionTitle;

  set productOptionTitle(String value) {
    _productOptionTitle = value;
  }

  List<Option> get productOptions => _productOptions;

  set productOptions(List<Option> value) {
    _productOptions = value;
  }

  Extra get extra => _extra;

  set extra(Extra value) {
    _extra = value;
  }
}