import 'package:cartexample/view/screen/cart.dart';
import 'package:cartexample/view/widget/cart_counter.dart';
import 'package:cartexample/view/widget/product_item.dart';
import 'package:cartexample/viewmodel/productsVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Padding(
              padding:
              const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                const  Align(
                      alignment: Alignment.bottomCenter,
                      child:
                      Icon(Icons.shopping_cart_rounded,
                          color: Colors.black54, size: 25)
                ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Consumer<ProductsVM>(
                      builder: (context, value, child) => CartCounter(
                        count: value.lst.length.toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        centerTitle: true,
        title:  Text(
          "App",
          style: TextStyle(color: Colors.grey[800]),
        ),
      ),
      body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: prds.length,
              itemBuilder: (context, index) => ProductItem(
                screenSize: screenSize,
                image: prds[index]["image"].toString(),
                itemName: prds[index]["name"].toString(),
              ),
            ),
          )),
    );
  }
}

final prds = [
  {
    "name": "Product1",
    "image":
   "https://m.media-amazon.com/images/I/61-r9zOKBCL._SL1500_.jpg"
  },
  {
    "name": "Product2",
    "image":
    "https://m.media-amazon.com/images/I/71PvHfU+pwL._SL1500_.jpg"
  },
  {
    "name": "Product3",
    "image":
    "https://m.media-amazon.com/images/I/71otei-O3-L._SL1500_.jpg"
  },
  {
    "name": "Product4",
    "image":
    "https://m.media-amazon.com/images/I/71x+m2-yb7L._SL1500_.jpg"
  },
  {
    "name": "Product5",
    "image":
    "https://m.media-amazon.com/images/I/71WJjfuEf7L._SL1200_.jpg"
  },

];
