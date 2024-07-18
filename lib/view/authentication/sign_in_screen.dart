// ignore_for_file: use_build_context_synchronously

import 'package:e_shop/controller/providers/auth_provider.dart';
import 'package:e_shop/utils/constants.dart';
import 'package:e_shop/view/authentication/sign_up_screen.dart';
import 'package:e_shop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    bool isSuccess =
        await Provider.of<AuthProvider>(context, listen: false).login(
      _emailController.text,
      _passwordController.text,
    );

    if (isSuccess) {
      Navigator.pushReplacementNamed(context, 'a');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Login failed. Please check your credentials.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('e-shop', style: ktextstyle1),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 180, left: 8, right: 8),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormWidget(
                  controller: _emailController,
                  label: 'Email',
                  validationMsg: 'Please enter your email',
                ),
                kheight10,
                TextFormWidget(
                  controller: _passwordController,
                  label: 'Password',
                  isObscure: true,
                  validationMsg: 'Please enter your password',
                ),
                kheight200,
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _submit();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: kwhite,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 94, vertical: 12),
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: kwhite,
                        fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Login'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New Here?', style: ktextstyle2),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text('SignUp', style: ktextstyle3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
