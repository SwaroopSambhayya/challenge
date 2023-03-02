import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBottomBarItem extends StatelessWidget {
  final Icon icon;
  const AnimatedBottomBarItem({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return icon
        .animate(delay: defaultDuration)
        .fadeIn()
        .moveY(begin: 0, end: 7, curve: Curves.bounceOut);
  }
}
