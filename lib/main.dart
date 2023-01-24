import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'category_class.dart';
import 'item_screen.dart';
import 'item_widget.dart';
import 'my_provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e-commerce',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Category>> getCategories() async {
    final url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);

    var jsonString = response.body;
    List<Category> categories = categoryFromJson(jsonString);

    return categories;
  }

  late Future<List<Category>> futureCategory = getCategories();

  @override
  void initState() {
    super.initState();
    futureCategory = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Buy it",
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<Category>>(
              future: futureCategory,
              builder: (context, snapshot) {
                List<Category>? items = snapshot.data;
                return items == null
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: GridView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ItemScreen(item: item)));
                              },
                              child: ItemWidget(item),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        ),
                      );
              }),
        ],
      ),
    );
  }
}
