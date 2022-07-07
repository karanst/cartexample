import 'package:cartexample/model/product_model.dart';
import 'package:flutter/widgets.dart';


class ProductsVM with ChangeNotifier {
  List<Products> lst = [];

  add(String image, String name) {
    lst.add(Products(image: image, name: name));
    notifyListeners();
  }

  del(int index) {
    lst.removeAt(index);
    notifyListeners();
  }
}