import 'dart:convert';

import 'package:api_integrations/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Product> product = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: InkWell(
                      onTap: () async {
                        const baseURL = 'https://fakestoreapi.com';

                        const endPoint = '/carts';

                        const finalURL = baseURL + endPoint;

                        final query = {"sort": "asc"};

                        final queryEndpoint =
                            Uri.https('fakestoreapi.com', endPoint, query);

                        Product product = Product(
                          category: "category",
                          id: 1,
                          image: "umage",
                          title: "title",
                          rating: Rating(count: 12, rating: 234),
                          description: "dectiptiol",
                          price: 10,
                        );

                        try {
                          final res = await http.get(queryEndpoint);

                          print(res.body);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Text('Get request')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
