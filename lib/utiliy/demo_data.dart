import 'package:cofeeshop/models/extra.dart';
import 'package:cofeeshop/models/option.dart';
import 'package:cofeeshop/models/product.dart';

class DemoData {
  List<Option> productOptions = [];

  Product product1 = Product(
      1,
      'Flat White',
      'Freshly-ground beans and steamed milk',
      125,
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/330px-A_small_cup_of_coffee.JPG',
      'MILK OPTION',
      [
        Option(1,'Full Milk', 0),
        Option(2,'Skim Milk', 0),
        Option(3,'Soy Milk', 20),
      ],
      Extra(0,1));
}



