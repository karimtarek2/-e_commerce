import 'package:flutter/material.dart';

import 'category_class.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key, required this.item}) : super(key: key);
  final Category item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Buy it",
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
          maxLines: 2,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5,top: 8,right: 5,bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 300,
                //padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: .1),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(item.image), fit: BoxFit.contain),
                ),
              ),
              Text(
                item.description,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
