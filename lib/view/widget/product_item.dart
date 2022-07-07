import 'package:cartexample/viewmodel/productsVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  ProductItem(
      {required this.screenSize, required this.image, required this.itemName});

  final Size screenSize;
  final String image, itemName;
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[700]!.withOpacity(0.3),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            // width: 50,
            child: Image.network(image),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              itemName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
          ),
          Consumer<ProductsVM>(
              builder: (context, value, child) => onPressed
                  ? const Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: Icon(
                        Icons.check_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                    )
                  : Container(
                      height: 20,
                      width: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black38, shape: StadiumBorder()),
                        onPressed: () {
                          onPressed = true;

                          value.add(image, itemName);
                          final snackBar = SnackBar(
                            content: Text('$itemName added to cart'),
                            backgroundColor: (Colors.black12),
                            action: SnackBarAction(
                              label: 'dismiss',
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
              ),
        ],
      ),
    );
  }
}
