import 'package:challenge/features/coaches/components/grid_component.dart';
import 'package:challenge/shared/const.dart';
import 'package:challenge/shared/utils.dart';
import 'package:flutter/material.dart';

class CoachGridView extends StatelessWidget {
  const CoachGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisExtent: 290),
          itemBuilder: (context, index) {
            return GridComponent(
              coachData: dummyCoaches[index],
              animationVariation: getVariationValue(index),
              animationDirection: index % 2 == 0
                  ? AnimationDirection.left
                  : AnimationDirection.right,
            );
          },
          itemCount: dummyCoaches.length,
        ),
      ),
    );
  }
}
