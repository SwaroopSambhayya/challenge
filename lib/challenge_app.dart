import 'package:challenge/shared/components/animated_bottom_bar_item.dart';
import 'package:challenge/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ChallengeApp extends StatefulWidget {
  final Widget child;
  const ChallengeApp({super.key, required this.child});

  @override
  State<ChallengeApp> createState() => _ChallengeAppState();
}

class _ChallengeAppState extends State<ChallengeApp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      backgroundColor: getBackgroundColor(context),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getBottomBarHiddenStatus(context)
          ? null
          : AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: getBottomBarHiddenStatus(context) ? 0 : 1,
              child: BottomNavigationBar(
                  elevation: 0,
                  iconSize: 22,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: selectedIndex,
                  backgroundColor: Theme.of(context).bottomAppBarTheme.color,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: AnimatedBottomBarItem(
                        icon: selectedIndex == 0
                            ? const Icon(IconlyBold.home)
                            : const Icon(IconlyLight.home),
                      ),
                    ),
                    const BottomNavigationBarItem(
                      label: "Chat",
                      icon: AnimatedBottomBarItem(
                        icon: Icon(IconlyLight.chat),
                      ),
                    ),
                    const BottomNavigationBarItem(
                      label: "Account",
                      icon:
                          AnimatedBottomBarItem(icon: Icon(IconlyLight.user2)),
                    ),
                    const BottomNavigationBarItem(
                      label: "Search",
                      icon:
                          AnimatedBottomBarItem(icon: Icon(IconlyLight.search)),
                    ),
                  ]),
            ),
    );
  }
}
