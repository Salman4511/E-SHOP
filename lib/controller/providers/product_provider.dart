import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Product {
  final String title;
  final double price;
  final double discountPercentage;

  Product({
    required this.title,
    required this.price,
    required this.discountPercentage,
  });

  double get discountedPrice => price - (price * discountPercentage / 100);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
    );
  }
}

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _showDiscountedPrice = false;

  List<Product> get products => _products;
  bool get showDiscountedPrice => _showDiscountedPrice;

  Future<void> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      final data = json.decode(response.body);
      _products = (data['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
      await _fetchRemoteConfig();
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
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
