import 'package:challenge/shared/route.dart';
import 'package:challenge/shared/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Challenge',
      debugShowCheckedModeBanner: false,
      theme: ChallengeTheme().base(),
      routerConfig: route,
    );
  }
}
