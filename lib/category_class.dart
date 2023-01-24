// import 'dart:convert';
//
// List<Category> categoryFromJson(jsonString) => List<Category>.from(
//     json.decode(jsonString).map((item) => Category.fromJson(item)));
//
// class Category {
//   Category({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//   });
//
//   int id;
//   String title;
//   int price;
//   String description;
//   String category;
//   String image;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"],
//         description: json["description"],
//         category: json["category"],
//         image: json["image"],
//       );
// }
// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  CategoryEnum category;
  String image;
  Rating rating;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: categoryEnumValues.map[json["category"]]!,
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryEnumValues.reverse[category],
    "image": image,
    "rating": rating.toJson(),
  };
}

enum CategoryEnum { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryEnumValues = EnumValues({
  "electronics": CategoryEnum.ELECTRONICS,
  "jewelery": CategoryEnum.JEWELERY,
  "men's clothing": CategoryEnum.MEN_S_CLOTHING,
  "women's clothing": CategoryEnum.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
