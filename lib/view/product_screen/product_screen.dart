import 'package:e_shop/controller/providers/auth_provider.dart';
import 'package:e_shop/controller/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Products'),
      actions:[ IconButton(onPressed: (){
        authProvider.logout();
      }, icon: Icon(Icons.logout_outlined)),]),
      body: FutureBuilder(
        future: productProvider.fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final product = snapshot.data;
            return ListView.builder(
              itemCount: product!.products!.length,
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(product.products![i].title??""),
                  subtitle: Text(productProvider.showDiscountedPrice
                      ? 'Discounted Price: \$${product.products![i].discountPercentage}'
                      : 'Price: \$${product.products![i].price.toString()}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
