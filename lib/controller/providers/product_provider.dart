import 'package:e_shop/model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _showDiscountedPrice = false;

  List<ProductModel> get products => _products;
  bool get showDiscountedPrice => _showDiscountedPrice;

  // Future<void> fetchProducts() async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse('https://dummyjson.com/products'));
  //     final data = json.decode(response.body);
  //     _products = (data['products'] as List)
  //         .map((item) => ProductModel.fromJson(item))
  //         .toList();
  //     await _fetchRemoteConfig();
  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //     throw e;
  //   }
  // }
   Future<ProductModel> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        print('Response OK');
        Map<String, dynamic> jsonData = json.decode(response.body);
        ProductModel products = ProductModel.fromJson(jsonData);
      //  await _fetchRemoteConfig();

        return products;
      } else {
        throw Exception("Failed to fetch products");
      }
    } catch (error) {
      throw Exception("Error: --> $error");
    }
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.fetchAndActivate();
      _showDiscountedPrice = remoteConfig.getBool('showDiscountedPrice');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
