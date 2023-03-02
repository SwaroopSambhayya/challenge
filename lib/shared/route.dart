import 'package:challenge/challenge_app.dart';
import 'package:challenge/features/coaches/coachDetail/coach_detail.dart';
import 'package:challenge/features/coaches/coaches.dart';
import 'package:challenge/features/coaches/models/coach.dart';
import 'package:challenge/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
var route = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/home",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => ChallengeApp(
        child: child,
      ),
      routes: [
        GoRoute(
            path: "/home",
            builder: (context, state) => const Home(),
            routes: [
              GoRoute(
                  path: "coaches/:title/:count",
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      child: Coaches(
                        tag: state.params['title']!,
                        count: int.parse(state.params['count']!),
                      ),
                      transitionsBuilder: customTransitionBuilder,
                      transitionDuration: const Duration(milliseconds: 300),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: "coachDetails",
                      pageBuilder: (context, state) {
                        return CustomTransitionPage(
                          child: CoachDetail(coachData: state.extra as Coach),
                          transitionsBuilder: customTransitionBuilder,
                          transitionDuration: const Duration(milliseconds: 300),
                        );
                      },
                    )
                  ]),
            ]),
      ],
    ),
  ],
);

Widget customTransitionBuilder(
    context, animation, secondaryAnimation, mainchild) {
  Animation<double> myAnimation =
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  return AnimatedBuilder(
      animation: myAnimation,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: myAnimation,
          child: mainchild,
        );
      });
}
