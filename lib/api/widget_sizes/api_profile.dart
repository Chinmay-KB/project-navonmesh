import 'package:flutter/material.dart';

class ProfileSize {
  var screenWidth, screenHeight, scalingFactor;

  ProfileSize(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    scalingFactor = MediaQuery.of(context).devicePixelRatio;
  }

  getQrSize() => screenWidth / 2.2;

  getInfoRowSize() => screenWidth;
}
