import 'package:e_shop/controller/providers/auth_provider.dart';
import 'package:e_shop/utils/constants.dart';
import 'package:e_shop/view/authentication/sign_in_screen.dart';
import 'package:e_shop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _nameController = TextEditingController();

  void _submit() {
    Provider.of<AuthProvider>(context, listen: false).signUp(
      _emailController.text,
      _passwordController.text,
      _nameController.text,
    );
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
          padding: const EdgeInsets.only(top: 60, left: 8, right: 8),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               TextFormWidget(controller: _nameController, label:'Name', validationMsg: 'Please enter your name',),
               kheight10,
                TextFormWidget(controller: _emailController, label: 'Email', validationMsg: 'Please enter your email',),
                kheight10,
                TextFormWidget(controller: _passwordController, label: 'Password',isObscure: true, validationMsg: 'Please enter your password',),
                kheight200,
                ElevatedButton(
                  onPressed: 
                  (){
                    if(_formkey.currentState!.validate()){
                      _submit();
                      }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: kwhite,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 94, vertical: 12),
                    textStyle: const TextStyle(
                        fontSize: 17, color: kwhite, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Sign Up',),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?',style: ktextstyle2,),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                      },
                      child: const Text('Login',style: ktextstyle3,),
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
