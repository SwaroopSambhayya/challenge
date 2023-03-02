import 'package:challenge/features/coaches/coachDetail/models/cards_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachAnimationNotifier extends StateNotifier<CardStatus> {
  late CardStatus initialStatus;
  CoachAnimationNotifier(Size screenSize) : super(CardStatus()) {
    initState(screenSize);
  }
  bool cardOneExpanded = false;
  bool cardTwoExpanded = false;
  bool cardThreeExpanded = false;
  late Size screenSize;
  initState(Size screenSize) {
    this.screenSize = screenSize;
    initialStatus = CardStatus(
        imageHeight: screenSize.height / 2.2,
        cardOneTop: screenSize.height * 0.4,
        cardTwoTop: screenSize.height * 0.51,
        cardThreeTop: screenSize.height * 0.6);
    state = initialStatus;
  }

  onCardOneInteraction() {
    if (cardOneExpanded) {
      cardOneExpanded = false;
      state = initialStatus;
    } else {
      cardOneExpanded = true;
      state = CardStatus(
          imageHeight: screenSize.height / 4,
          cardOneTop: screenSize.height * 0.15,
          cardTwoTop: screenSize.height * 0.71,
          cardThreeTop: screenSize.height * 0.8);
    }
  }

  onCardTwoInteraction() {
    if (cardTwoExpanded) {
      cardTwoExpanded = false;
      cardOneExpanded = false;
      state = initialStatus;
    } else {
      cardTwoExpanded = true;
      state = state.copyWith(
          imageHeight: screenSize.height / 4,
          cardTwoTop: screenSize.height * 0.16,
          cardThreeTop: screenSize.height * 0.8);
    }
  }

  onCardThreeInteraction() {
    if (cardThreeExpanded) {
      cardThreeExpanded = false;
      cardTwoExpanded = false;
      cardOneExpanded = false;
      state = initialStatus;
    } else {
      cardThreeExpanded = true;
      state = state.copyWith(
          imageHeight: screenSize.height / 4,
          cardThreeTop: screenSize.height * 0.17);
    }
  }
}
