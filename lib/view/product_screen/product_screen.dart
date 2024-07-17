import 'package:e_shop/controller/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: FutureBuilder(
        future: productProvider.fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (ctx, i) {
                final product = productProvider.products[i];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(productProvider.showDiscountedPrice
                      ? 'Discounted Price: \$${product.discountedPrice}'
                      : 'Price: \$${product.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
