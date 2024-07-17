import 'package:e_shop/controller/providers/auth_provider.dart';
import 'package:e_shop/controller/providers/product_provider.dart';
import 'package:e_shop/view/authentication/sign_up_screen.dart';
import 'package:e_shop/view/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: const FirebaseOptions(
      apiKey: "AIzaSyDoyzaItO468MQrXCp2sahxEJbdcfWtRL0",
      appId: "1:153609924015:android:182c2fd181540382ef135a",
      messagingSenderId: '153609924015',
      projectId: 'e-shop-56673',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Consumer<AuthProvider>(
          builder: (ctx, auth, _) {
            return auth.isAuthenticated ? const ProductsScreen() : const SignUpScreen();
          },
        ),
      ),
    );
  }
}

