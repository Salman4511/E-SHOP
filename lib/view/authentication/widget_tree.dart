import 'package:e_shop/view/authentication/sign_up_screen.dart';
import 'package:e_shop/view/product_screen/product_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
                return const ProductsScreen();
              } else {
                return const SignUpScreen();
              } 
            }
          }),
    );
  }
}
