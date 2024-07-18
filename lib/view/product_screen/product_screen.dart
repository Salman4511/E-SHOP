import 'package:e_shop/controller/providers/auth_provider.dart';
import 'package:e_shop/controller/providers/product_provider.dart';
import 'package:e_shop/utils/constants.dart';
import 'package:e_shop/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('e-shop', style: ktextstyle4),
          backgroundColor: kblue,
          automaticallyImplyLeading: false,
          actions: [
            Consumer<AuthProvider>(
              builder:(context, value, child) =>IconButton(
                  onPressed: () async{
                  await authProvider.logout();
                  },
                  icon: const Icon(Icons.logout_outlined)),
            ),
          ]),
      body: FutureBuilder(
        future: productProvider.fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final product = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemCount: product!.products!.length,
                itemBuilder: (ctx, i) {
                  final actualPrice = product.products![i].price;
                  final discountPercentage =
                      product.products![i].discountPercentage;
                  final discountPrize =
                      actualPrice! * (1 - discountPercentage! / 100);
                  return ProductCard(
                      imageUrl: product.products![i].images![0],
                      title: product.products![i].title ?? "",
                      description: product.products![i].description ?? '',
                      actualPrice: product.products![i].price ?? 0,
                      offerPrice: discountPrize,
                      offerPercent:
                          product.products![i].discountPercentage ?? 0);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
