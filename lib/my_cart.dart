import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'item_widget.dart';
import 'my_provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context, listen: true);
    var myCart = provider.myCart;

    if (myCart.isEmpty) {
      return const Center(
        child: Text('Empty!'),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
            itemCount: myCart.length,
            itemBuilder: (context, index) {
              final item = myCart[index];
              return Center();
            }),
      );
    }
  }
}
