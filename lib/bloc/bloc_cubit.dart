import 'dart:convert';

import 'package:api_integrations/bloc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product.dart';
import 'package:http/http.dart' as http;

class APICubit extends Cubit<APIState> {
  APICubit() : super(APIInital());

  void getAllProducts() async {
    emit(APILoading('Please wait...'));

    const baseURL = 'https://fakestoreapi.com';

    const endPoint = '/products';

    const finalURL = baseURL + endPoint;

    final query = {"sort": "asc"};

    final queryEndpoint = Uri.https('fakestoreapi.com', endPoint, query);

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

      final data = jsonDecode(res.body);

      List<Product> list = [];

      for (Map<String, dynamic> json in data) {
        list.add(Product.fromJson(json));
      }

      emit(APISuccess(list));

      print(res.body);
    } catch (e) {
      print(e);

      emit(APIError(e.toString()));
    }
  }



}
