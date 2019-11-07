import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/values/colors.dart';

class LoadingDialog extends StatefulWidget {
  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: HomepageCardsizeApi(context).getScreenWidth() * 0.8,
        height: HomepageCardsizeApi(context).getScreenWidth() * 0.2,
        color: ColorValues.BACKGROUND_GRADIENT_3,
        child: Center(
            child: CircularProgressIndicator()),
      ),
    );
  }
}
