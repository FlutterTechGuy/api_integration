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

                        const endPoint = '/products';

                        const finalURL = baseURL + endPoint;

                        final res = await http.get(Uri.parse(finalURL));

                        final data = jsonDecode(res.body);

                        print(data[0]);
                        product = [];
                        for (Map<String, dynamic> e in data) {
                          product.add(Product.fromJson(e));
                        }
                      },
                      child: const Text('Get request')),
                ),
                ...List.generate(product.length, (index) {
                  Product currentProduct = product[0];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(currentProduct.image),
                        ),
                        trailing: Text(
                            '${currentProduct.rating.count} gave overall rating of ${currentProduct.rating.rating} '),
                        title: Text(currentProduct.title),
                        subtitle: Text(currentProduct.description),
                      ),
                      if (index != product.length - 1) const Divider()
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
