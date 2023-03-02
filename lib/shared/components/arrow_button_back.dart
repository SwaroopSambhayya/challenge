import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class ArrowButtonBack extends StatelessWidget {
  const ArrowButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () => context.pop(),
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.3),
          radius: 28,
          child: const Icon(
            IconlyLight.arrowLeft,
            color: Colors.white,
          ),
        ),
      ).animate().slideX(duration: defaultDuration, curve: Curves.easeInOut),
    );
  }
}
