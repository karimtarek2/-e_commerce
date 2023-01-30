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
  var itemCounter = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final provider = Provider.of<MyProvider>(context, listen: true);
    var myCart = provider.myCart;

    if (myCart.isEmpty) {
      return const Center(
        child: Text('Empty!'),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Cart',
            style: TextStyle(
              fontFamily: "Pacifico",
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.8,
              child: ListView.builder(
                  itemCount: myCart.length,
                  itemBuilder: (context, index) {
                    final item = myCart[index];
                    return Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    image: NetworkImage(item.image),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "EGP${item.price}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "Subtotal EGP ${provider.subTotal(item.id, item.price)}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    int newItemCounter =
                                        provider.itemCount[item.id] ?? 0;

                                    if (itemCounter <= 0) {
                                    } else {
                                      itemCounter = newItemCounter;
                                      itemCounter--;
                                    }
                                    Provider.of<MyProvider>(context,
                                            listen: false)
                                        .addcount(item.id, itemCounter);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(12),
                                    backgroundColor: Colors.grey[300]),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Text(
                                  "${Provider.of<MyProvider>(context, listen: false).itemcount(item.id)}"),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      int newItemCounter =
                                          provider.itemCount[item.id] ?? 0;

                                      itemCounter = newItemCounter;
                                      itemCounter++;
                                      Provider.of<MyProvider>(context,
                                              listen: false)
                                          .addcount(item.id, itemCounter);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(12),
                                      backgroundColor: Colors.grey[300]),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 12,
                                  )),
                              ElevatedButton(
                                onPressed: () {
                                  provider.toggleFavorite(item);
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[300]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    }
  }
}
