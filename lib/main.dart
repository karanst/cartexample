
import 'package:cartexample/view/screen/product_screen.dart';
import 'package:cartexample/viewmodel/productsVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsVM(),
        ),
      ],
      child: MaterialApp(
        title: 'Cart Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        //  backgroundColor: Colors.black45,
         // scaffoldBackgroundColor: Colors.grey[800],
          // accentColor: Colors.blueGrey[100],
          // primaryColor: Colors.blue[200],
          //visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductScreen(),
      ),
    );
  }
}

