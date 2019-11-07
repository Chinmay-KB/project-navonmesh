import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_navonmesh/homepage/searchDialog.dart';

class Appbar extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey;

  Appbar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    var scalingFactor = MediaQuery.of(context).devicePixelRatio;
    return AppBar(
      leading: GestureDetector(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Icon(Icons.menu,
          size: 30,),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            print("Icon clicked");
            showDialog(context: context,
                builder: (context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: SearchDialog(),);
                });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.search, size: 30,
            ),
          ),
        )
      ],
      title: Padding(
        padding: EdgeInsets.only(right: 15.0*scalingFactor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: 'inno_logo',
                child: Image.asset('assets/images/inno_logo.png', width: 15.0*scalingFactor,height: 15.0*scalingFactor,)),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text("Innovision",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
