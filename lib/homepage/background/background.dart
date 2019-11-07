import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_navonmesh/homepage/background/aminatedWave.dart';
import 'package:project_navonmesh/homepage/background/animatedBackground.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: AnimatedBackground()),
        onBottom(AnimatedWave(
          height: 180,
          speed: 0.3
        )),
        onBottom(AnimatedWave(
          height: 170,
          speed: 0.1,
          offset: pi,
        )),
        onBottom(AnimatedWave(
          height: 220,
          speed: 0.4,
          offset: pi / 2,
        )),
      ],
    );
  }
  onBottom(Widget child) => Positioned.fill(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: child,
    ),
  );
}
