import 'dart:io';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  String hintText;
  bool obscure;
  TextEditingController controller;

  CustomTextField({
    this.hintText = "",
    this.obscure = false,
    this.controller
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        hintText: "$hintText",
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        // labelStyle: TextStyle(color: Colors.white),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF2e7d32), width: 2),
        ),
      ),
      cursorColor: Color(0XFF2e7d32)
    );
  } 
}