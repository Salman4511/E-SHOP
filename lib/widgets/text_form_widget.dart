import 'package:e_shop/utils/constants.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
    final TextEditingController controller;
    final String label;
    final bool? isObscure;
    final String validationMsg;
  const TextFormWidget({super.key, 
 required this.controller, required this.label, this.isObscure, required this.validationMsg});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        fillColor: kwhite,
        filled: true,
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
        ),
        
      ),
      obscureText: isObscure==true?true:false,
      validator:(value) {
        if (value == null || value.isEmpty) {
          return validationMsg;
        }
        return null;
      },
    );
  }
}
