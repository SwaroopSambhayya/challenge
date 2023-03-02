import 'package:challenge/features/coaches/coachDetail/models/cards_status.dart';
import 'package:challenge/features/coaches/coachDetail/repository/coach_detail_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardAnimationStatusProvider =
    StateNotifierProvider.family<CoachAnimationNotifier, CardStatus, Size>(
  (ref, screenSize) => CoachAnimationNotifier(screenSize),
);
