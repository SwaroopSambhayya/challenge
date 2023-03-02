import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Photos extends ConsumerWidget {
  const Photos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(photos[index]),
            )
                .animate()
                .scaleY(duration: defaultDuration, curve: Curves.easeInOut);
          },
          itemCount: photos.length,
        ),
      ),
    );
  }
}
