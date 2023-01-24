import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import 'category_class.dart';
import 'my_provider.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key, required this.item}) : super(key: key);
  final Category item;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
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
          padding: const EdgeInsets.only(left: 5, top: 8, right: 5, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SmoothStarRating(
                    rating: widget.item.rating.rate,
                    size: 20,
                    starCount: 5,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "(${widget.item.rating.rate})",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 300,
                //padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: .1),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.item.image),
                      fit: BoxFit.contain),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Provider.of<MyProvider>(context, listen: false)
                              .toggleFavorite(widget.item);
                        },
                        child: (Provider.of<MyProvider>(context)
                                .isFavorite(widget.item.id)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              )),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.item.description,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
