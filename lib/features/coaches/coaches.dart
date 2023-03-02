import 'package:challenge/features/coaches/components/coaches_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class Coaches extends StatelessWidget {
  final String tag;
  final int count;
  const Coaches({super.key, required this.tag, required this.count});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(top: 55),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(55),
          )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => context.pop(),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  IconlyLight.arrowLeft,
                  color: Colors.white,
                ),
              ),
            )
                .animate()
                .slideX(
                  begin: 1,
                  end: 0,
                  delay: const Duration(milliseconds: 100),
                )
                .fadeIn(),
            Container(
              padding: const EdgeInsets.only(top: 5.0, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Hero(
                    tag: tag,
                    child: Text(
                      tag,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      "   /$count",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color(0xffA5A6E2),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: CoachGridView())
          ],
        ),
      ),
    );
  }
}
