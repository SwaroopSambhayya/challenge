import 'package:challenge/features/home/components/card.dart';
import 'package:challenge/features/home/components/chip_list.dart';
import 'package:challenge/features/home/components/search_field.dart';
import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const AnimatedSearchTitle(),
                const Align(alignment: Alignment.center, child: SearchField()),
                ChipList(
                  chipList: searchChipList,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 60),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 0,
                      child: CustomCard(
                        title: "TOP CHALLENGES",
                        count: 256,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(55),
                          bottomRight: Radius.circular(55),
                        ),
                        backgroundColor: Colors.black,
                        titleColor: Color(0xffA5A6E2),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 80,
                      child: GestureDetector(
                        onVerticalDragStart: (details) {},
                        onVerticalDragUpdate: (details) {},
                        child: CustomCard(
                          title: "POPULAR COACHES",
                          count: 60,
                          animationDirection: AnimationDirection.right,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(55),
                            bottomLeft: Radius.circular(55),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          titleColor: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: -90,
                      child: CustomCard(
                        title: "FOR YOU",
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(55),
                          bottomRight: Radius.circular(55),
                        ),
                        count: 200,
                        backgroundColor: Colors.white,
                        titleColor: Theme.of(context).cardTheme.color!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedSearchTitle extends StatefulWidget {
  const AnimatedSearchTitle({
    super.key,
  });

  @override
  State<AnimatedSearchTitle> createState() => _AnimatedSearchTitleState();
}

class _AnimatedSearchTitleState extends State<AnimatedSearchTitle> {
  bool reverseAnimation = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GoRouter.of(context).addListener(() {
        setState(() {
          reverseAnimation = !reverseAnimation;
        });
      });
    });
  }

  Widget getAnimatedText() {
    Text text = Text(
      "SEARCH FOR YOUR NEXT CHALLENGE",
      style: Theme.of(context).textTheme.headlineLarge,
    );
    if (reverseAnimation) {
      return text
          .animate()
          .slideY(
              begin: 0,
              end: -4,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut)
          .hide(
            delay: const Duration(milliseconds: 600),
          );
    }
    return text.animate().slideY(
        begin: -3, end: 0, duration: defaultDuration, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: getAnimatedText(),
      ),
    );
  }
}
