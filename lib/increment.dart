import 'package:flutter/material.dart';

import 'category_class.dart';
class Increment extends StatefulWidget {
  const Increment({Key? key, required this.item}) : super(key: key);
  final Category item;
  @override
  State<Increment> createState() => _IncrementState();
}
int itemCount = 0;
class _IncrementState extends State<Increment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>itemCount--),):new Container(),
        new Text(itemCount.toString()),
        new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>itemCount++))

      ],
    );
  }
}
