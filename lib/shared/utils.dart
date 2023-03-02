import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Color getBackgroundColor(BuildContext context) {
  if (GoRouter.of(context).location.contains("/home/")) {
    return Theme.of(context).colorScheme.primary;
  }
  return Theme.of(context).scaffoldBackgroundColor;
}

bool getBottomBarHiddenStatus(BuildContext context) {
  if (GoRouter.of(context).location.contains("/home/")) {
    return true;
  }
  return false;
}

int getVariationValue(int index) {
  return index % 2 == 0 ? (index + 1) * 150 : index * 150;
}

getExpandStatusDimensions(bool expandMode, Function setState) {
  if (expandMode) {}
}
