import 'package:flutter/material.dart';

class HomepageCardsizeApi {
  var screenWidth, screenHeight, scalingFactor;
  var cardWidthFactor = 0.7;
  var cardHeightFactor = 0.75;
  var cardTitleScaleFactor = 0.03;
  var cardDetailsFactor = 0.017;
  var cardIconFactor = 0.03;
  var cardButtonRowSizeFactor = 3.7;
  var cardButtonTextFactor = 0.025;
  var cardButtonWidthFactor = 2.1;
  var cardButtonAlignFactor = 1.5;

  HomepageCardsizeApi(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    scalingFactor = MediaQuery.of(context).devicePixelRatio;
  }

  getScreenWidth() => screenWidth;

  getScreenHeight() => screenHeight;

  getScalingFactor() => scalingFactor;

  getCardWidth() => screenWidth * cardWidthFactor;

  getCardHeight() => screenHeight * cardHeightFactor;

  getCardTitleSize() => screenHeight * cardTitleScaleFactor;

  getCardIconSize() => screenHeight * cardIconFactor;

  getCardDetailsSize() => screenHeight * cardDetailsFactor;

  getCardButtonBoxSize() => screenWidth / cardButtonRowSizeFactor;

  getCardButtonTextSize() => screenHeight * cardButtonTextFactor;

  getCardButtonWidth() => getCardWidth() / cardButtonWidthFactor;

  getCardButtonAlign() => scalingFactor * cardButtonAlignFactor;
}
