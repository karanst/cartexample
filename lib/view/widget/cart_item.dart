import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      { required this.screenSize, required this.image, required this.itemName, required this.del});

  final Size screenSize;
  final String image, itemName;
  final Function del;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 60,
      width: screenSize.width,
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
          mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: MediaQuery.of(context).size.height,
          // width: 50,
          child: Image.network(image),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Text(
            itemName ,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ]),
    );
  }
}