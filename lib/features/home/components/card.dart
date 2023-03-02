import 'dart:math';

import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Color backgroundColor;
  final Duration? animationDuration;
  final Color titleColor;
  final Offset? animatedOffset;
  final Widget? trailing;
  final MainAxisAlignment? rowMainAxisAlignment;
  final String? tag;
  final Widget? content;
  final double? width;
  final double? height;
  final AnimationDirection animationDirection;
  final Function(DragStartDetails)? onVerticalDragStart;
  final BorderRadiusGeometry borderRadius;
  final int count;
  const CustomCard(
      {super.key,
      required this.title,
      required this.count,
      this.animationDuration,
      this.tag,
      this.animatedOffset,
      this.rowMainAxisAlignment,
      this.subtitle,
      this.trailing,
      required this.borderRadius,
      this.onVerticalDragStart,
      this.content,
      this.backgroundColor = Colors.white,
      this.animationDirection = AnimationDirection.left,
      this.width,
      this.height,
      this.titleColor = Colors.white});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  bool animated = false;
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: widget.onVerticalDragStart ??
          (details) {
            context.go("/home/coaches/${widget.title}/${widget.count}");
          },
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.8,
        height: widget.height ?? MediaQuery.of(context).size.height / 3.5,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: widget.borderRadius, color: widget.backgroundColor),
        child: Column(
          children: [
            Hero(
              tag: widget.tag ?? widget.title,
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                if (flightDirection == HeroFlightDirection.pop) {
                  return TitleText(
                    text: widget.title,
                    titleColor: widget.titleColor,
                  );
                }
                return toHeroContext.widget;
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: widget.rowMainAxisAlignment == null
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(
                          text: widget.title,
                          titleColor: widget.titleColor,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (widget.subtitle != null)
                          Text(widget.subtitle!,
                              style: Theme.of(context).textTheme.bodySmall)
                      ],
                    ),
                    if (widget.trailing == null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "      /${widget.count}",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xffA5A6E2),
                                  ),
                        ),
                      )
                    else
                      widget.trailing!
                  ],
                ),
              ),
            ),
            if (widget.content != null) Expanded(child: widget.content!)
          ],
        ),
      )
          .animate(
            autoPlay: !animated,
            controller: _animationController,
            onComplete: (controller) {
              setState(() {
                animated = true;
              });
            },
          )
          .slide(
            duration: widget.animationDuration ?? defaultDuration,
            curve: Curves.easeInOut,
            begin: widget.animatedOffset ??
                (widget.animationDirection == AnimationDirection.left
                    ? Offset.fromDirection(-pi)
                    : Offset.fromDirection(0)),
          ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final Color titleColor;
  const TitleText({super.key, required this.text, required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontSize: 20, color: titleColor),
    );
  }
}
