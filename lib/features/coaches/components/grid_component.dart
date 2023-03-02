import 'package:challenge/features/coaches/models/coach.dart';
import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class GridComponent extends StatelessWidget {
  final Coach coachData;
  final AnimationDirection animationDirection;
  final int animationVariation;
  const GridComponent(
      {super.key,
      required this.coachData,
      required this.animationDirection,
      required this.animationVariation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("${GoRouter.of(context).location}/coachDetails",
            extra: coachData);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xff695FF9),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: coachData.name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      coachData.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0).copyWith(bottom: 5),
              child: Text(
                coachData.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 4),
              child: Text(
                coachData.occupation,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Text(
                "${coachData.challenge} challenges",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color(0xffA5A6E2),
                    ),
              ),
            )
          ],
        ),
      ).animate()
        ..move(
            begin: animationDirection == AnimationDirection.left
                ? const Offset(-100, 100)
                : const Offset(100, 100),
            duration: Duration(
                milliseconds:
                    defaultDuration.inMilliseconds + animationVariation - 500),
            end: const Offset(0, 0),
            curve: Curves.easeOut),
    );
  }
}
