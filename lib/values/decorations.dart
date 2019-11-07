import 'package:flutter/material.dart';
import 'package:project_navonmesh/values/colors.dart';

class Decorations{

  static double textScalingFactor;
  static String hintText;

  Decorations.forDecoration(double t, String ht){
    textScalingFactor =t;
    hintText=ht;

  }

  Decorations.forTextIP(double t){
    textScalingFactor =t;

  }


  TextStyle TEXT_FIELD_INPUT_DECORATION=TextStyle(
      fontSize: textScalingFactor,
      color: Colors.white,
      fontWeight: FontWeight.w400);

  InputDecoration TEXT_FIELD_DECORATION=InputDecoration(
      contentPadding: EdgeInsets.only(
          left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
      filled: true,
      fillColor: ColorValues.COLOR_TEXTFIELD_LOGIN,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      hintStyle: TextStyle(
          fontSize: textScalingFactor ,
          fontWeight: FontWeight.w400,
          color: Colors.white));


}