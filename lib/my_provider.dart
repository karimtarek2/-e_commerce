import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'category_class.dart';

class MyProvider with ChangeNotifier {
  // String name = '';
  int itemCounter = 0;
  final map = Map<int, bool>();
  final itemCount = Map<int, int>();

  List<Category> myCart = [];

  bool isFavorite(int id) {
    return map[id] ?? false;
  }

  int? itemcount(int id) {
    if (itemCount[id] == null) {
      itemCount[id] = 0;
    } else {
      itemCount.forEach((key, value) {
        if (id == key) {
          itemCount[id];
        }
      });
    }
    return itemCount[id];
  }
  void decrementCounter (id){
    itemCount.forEach((key, value) {
      if (id == key){
        itemCounter--;
      }
    });
  }
  void incrementCounter (id){
    // itemCount.forEach((key, value) {
    //   if (id == key){
        itemCounter++;
    //   }
    // });
  }

  void addcount(int id, int count) {
    itemCount.addAll({id: count});
  }

  var total = 0.0;

  double subTotal(int id, double counter) {
    if(itemCount[id]== null){
      itemCount[id] = 0;
    }else{
      itemCount.forEach((key, value) {
        if(id == key) {
          total = itemCount[id]! * counter;
        }
      });
    }


    return total;
  }

  //
  // String tag = '';
  //
  // String? tags(int id) {
  //   if (tagMap[id] == null) {
  //     tagMap[id] = tag;
  //   } else {
  //     tagMap.forEach((key, value) {
  //       if (id == key) {
  //         tagMap[id];
  //       }
  //     });
  //   }
  //
  //   return tagMap[id];
  // }
  //
  void toggleFavorite(Category item) {
    final isFavorite = map[item.id] ?? false;
    map[item.id] = !isFavorite;

    if (isFavorite) {
      myCart.remove(item);
    } else {
      myCart.add(item);
    }

    notifyListeners();
  }
}
