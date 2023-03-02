import 'dart:math';

import 'package:challenge/features/coaches/coachDetail/providers/coach_detail_animation_status_provider.dart';
import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChipList extends ConsumerStatefulWidget {
  final List<String> chipList;
  final Color? chipColor;
  final bool scroll;
  const ChipList(
      {super.key, required this.chipList, this.scroll = true, this.chipColor});

  @override
  ConsumerState<ChipList> createState() => _ChipListState();
}

class _ChipListState extends ConsumerState<ChipList> {
  @override
  Widget build(BuildContext context) {
    bool isCardExpanded = ref
            .watch(cardAnimationStatusProvider(MediaQuery.of(context).size))
            .cardOneTop! <=
        MediaQuery.of(context).size.height * 0.2;
    return widget.scroll
        ? SizedBox(
            height: 45,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0)
                    .copyWith(left: index == 0 ? 20 : 5),
                child: Chip(
                  label: Text(
                    widget.chipList[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12),
                  ),
                ).animate().slideX(
                    begin: 2 * pi,
                    end: 0,
                    curve: Curves.easeInOut,
                    duration: defaultDuration),
              ),
              itemCount: widget.chipList.length,
            ),
          )
        : ProfileDetailChipset(
            widget: widget,
            autoPlay: isCardExpanded,
          );
  }
}

class ProfileDetailChipset extends ConsumerWidget {
  final bool autoPlay;
  const ProfileDetailChipset(
      {super.key, required this.widget, this.autoPlay = false});

  final ChipList widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
            spacing: 5,
            children: widget.chipList
                .map(
                  (e) => Chip(
                    backgroundColor: widget.chipColor,
                    label: Text(
                      e,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
                .toList())
        .animate(target: autoPlay ? 1 : 0)
        .fadeIn(duration: defaultDuration)
        .slideX(
            begin: 1, end: 0, curve: Curves.easeIn, duration: defaultDuration);
  }
}
