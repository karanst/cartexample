import 'package:cartexample/view/widget/cart_item.dart';
import 'package:cartexample/viewmodel/productsVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer<ProductsVM>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black54,),),
          centerTitle: true,
          title:  Text(
            "Cart",
            style: TextStyle(color: Colors.grey[800]),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: screenSize.height,
            width: double.infinity,
            child: ListView.builder(
              itemCount: value.lst.length ,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    value.del(index);
                    final snackBar = SnackBar(
                      content:  const Text('item removed from cart'),
                      backgroundColor: (Colors.black12),
                      action: SnackBarAction(
                        label: 'dismiss',
                        onPressed: () {
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: CartItem(
                    screenSize: screenSize,
                    image: value.lst[index].image,
                    itemName: value.lst[index].name, del: (){}, 
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}