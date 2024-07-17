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

  Future<ProductModel> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        ProductModel products = ProductModel.fromJson(jsonData);
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
