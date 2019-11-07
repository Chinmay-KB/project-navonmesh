import 'package:flutter/material.dart';
import 'package:project_navonmesh/values/colors.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 3),
          ColorTween(begin: ColorValues.BACKGROUND_GRADIENT_1, end: ColorValues.BACKGROUND_GRADIENT_2)),
      Track("color2").add(Duration(seconds: 3),
          ColorTween(begin: ColorValues.BACKGROUND_GRADIENT_3, end: ColorValues.BACKGROUND_GRADIENT_4))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}