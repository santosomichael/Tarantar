import 'dart:io';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{
  String text, family, fontFamilyUsed;
  Color color;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontSize;
  TextAlign textAlign;
  int type, maxLines;
  bool caps, italic;
  TextDecoration decoration;
  TextOverflow overflow;

  int typeFont;
  
  CustomText(
    this.text,
    {
    this.typeFont = 1,
    this.color = Colors.black,
    this.fontSize = 14, 
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.family = "Gotham",
    this.maxLines = 9999,
    this.overflow,
    this.textAlign
  });

  @override
  Widget build(BuildContext context){
    if (type == 1) {

    } else if (type == 2) {
      
    }

    return Text(
      this.text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: this.fontSize,
        color: this.color,
        fontFamily: this.family,
        fontWeight: this.fontWeight,
        fontStyle: this.fontStyle,
        decoration: this.decoration,
        decorationThickness: 2,
      ),
      textAlign: this.textAlign,
      maxLines: this.maxLines,
    );
    
  } 
  
}