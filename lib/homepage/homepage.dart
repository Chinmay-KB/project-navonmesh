import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_navonmesh/api/userdata.dart';
import 'package:project_navonmesh/api/widget_sizes/api_homepagecard.dart';
import 'package:project_navonmesh/bloc/bottom_appbar_provider.dart';
import 'package:project_navonmesh/homepage/appbar.dart';
import 'package:project_navonmesh/homepage/background/background.dart';
import 'package:project_navonmesh/homepage/bottom_navbar.dart';
import 'package:project_navonmesh/homepage/carousel.dart';
import 'package:project_navonmesh/homepage/drawer/drawer.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  Userdata userdata = new Userdata();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationBarProvider>(
        builder: (BuildContext context) => BottomNavigationBarProvider(),
        child: Stack(
          children: <Widget>[
            Hero(
              child: Background(),
              tag: 'background',
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              key: _scaffoldKey,
              drawer: Drawer(child: NavDrawer()),
              appBar: PreferredSize(
                  preferredSize: Size(
                      HomepageCardsizeApi(context).getScreenWidth(), 56.0),
                  child: Appbar(_scaffoldKey)),
              body: Stack(
                children: <Widget>[
                  Center(child: Carousel()),
                  Align(alignment: Alignment(0, 1), child: BottomNavBar()),
                ],
              ),
            ),
          ],
        )); //bottomNavigationBar: BottomNavBar(),
  }
}
