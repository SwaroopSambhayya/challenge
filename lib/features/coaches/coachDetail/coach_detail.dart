import 'package:challenge/features/coaches/coachDetail/components/challenges.dart';
import 'package:challenge/features/coaches/coachDetail/components/photos.dart';
import 'package:challenge/features/coaches/coachDetail/components/profile_details.dart';
import 'package:challenge/features/coaches/coachDetail/models/cards_status.dart';
import 'package:challenge/features/coaches/coachDetail/providers/coach_detail_animation_status_provider.dart';
import 'package:challenge/features/coaches/models/coach.dart';
import 'package:challenge/features/home/components/card.dart';
import 'package:challenge/shared/components/arrow_button_back.dart';
import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachDetail extends ConsumerStatefulWidget {
  final Coach coachData;
  const CoachDetail({super.key, required this.coachData});

  @override
  ConsumerState<CoachDetail> createState() => _CoachDetailState();
}

class _CoachDetailState extends ConsumerState<CoachDetail> {
  @override
  void dispose() {
    ref.invalidate(cardAnimationStatusProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    CardStatus cardStatus = ref.watch(
      cardAnimationStatusProvider(MediaQuery.of(context).size),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: const ArrowButtonBack(),
        elevation: 0,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            HeroImage(widget: widget, cardStatus: cardStatus),
            CardOne(
                cardStatus: cardStatus, widget: widget, screenSize: screenSize),
            CardTwo(
                cardStatus: cardStatus, widget: widget, screenSize: screenSize),
            CardThree(
                cardStatus: cardStatus, screenSize: screenSize, widget: widget)
          ],
        ),
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    required this.widget,
    required this.cardStatus,
  });

  final CoachDetail widget;
  final CardStatus cardStatus;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.coachData.name,
      child: AnimatedContainer(
        duration: Duration(milliseconds: defaultDuration.inMilliseconds - 400),
        width: MediaQuery.of(context).size.width,
        height: cardStatus.imageHeight,
        curve: Curves.easeInOut,
        child: Image.network(
          widget.coachData.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CardThree extends ConsumerWidget {
  const CardThree({
    super.key,
    required this.cardStatus,
    required this.screenSize,
    required this.widget,
  });

  final CardStatus cardStatus;

  final Size screenSize;
  final CoachDetail widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedPositioned(
      duration: defaultDuration,
      curve: Curves.easeOutBack,
      bottom: 0,
      top: cardStatus.cardThreeTop,
      child: CustomCard(
        animationDuration:
            Duration(milliseconds: defaultDuration.inMilliseconds),
        animatedOffset: const Offset(-1, 1),
        backgroundColor: Colors.black,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        onVerticalDragStart: (dragDetails) {
          ref
              .read(cardAnimationStatusProvider(screenSize).notifier)
              .onCardThreeInteraction();
        },
        title: "Photos",
        count: photos.length,
        tag: "Photos",
        content: const Photos(),
        width: MediaQuery.of(context).size.width,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class CardTwo extends ConsumerWidget {
  const CardTwo({
    super.key,
    required this.cardStatus,
    required this.widget,
    required this.screenSize,
  });

  final CardStatus cardStatus;
  final CoachDetail widget;
  final Size screenSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedPositioned(
      duration: defaultDuration,
      curve: Curves.easeOutBack,
      bottom: 0,
      top: cardStatus.cardTwoTop,
      child: CustomCard(
        animatedOffset: const Offset(-1, 1),
        animationDuration:
            Duration(milliseconds: defaultDuration.inMilliseconds - 100),
        backgroundColor: Theme.of(context).colorScheme.primary,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        onVerticalDragStart: (dragDetails) {
          ref
              .read(cardAnimationStatusProvider(screenSize).notifier)
              .onCardTwoInteraction();
        },
        title: "Available Challenges",
        count: challenges.length,
        tag: "Available Challenges",
        content: const Challenges(),
        width: MediaQuery.of(context).size.width,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class CardOne extends ConsumerWidget {
  const CardOne({
    super.key,
    required this.cardStatus,
    required this.widget,
    required this.screenSize,
  });

  final CardStatus cardStatus;
  final CoachDetail widget;
  final Size screenSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool expanded = ref
        .read(cardAnimationStatusProvider(screenSize).notifier)
        .cardOneExpanded;

    return AnimatedPositioned(
      duration: defaultDuration,
      curve: Curves.easeOutBack,
      bottom: 0,
      top: cardStatus.cardOneTop,
      child: CustomCard(
        subtitle: widget.coachData.occupation,
        animatedOffset: const Offset(-1, 1),
        animationDuration:
            Duration(milliseconds: defaultDuration.inMilliseconds - 200),
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        trailing: TextButton(
          onPressed: () {
            ref
                .read(cardAnimationStatusProvider(screenSize).notifier)
                .onCardOneInteraction();
          },
          child: Row(
            children: [
              Text(
                expanded ? "Show less" : "Show more",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 11),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                expanded ? IconlyLight.arrowUp : IconlyLight.arrowDown,
                size: 17,
              )
            ],
          ),
        ),
        onVerticalDragStart: (dragDetails) {
          ref
              .read(cardAnimationStatusProvider(screenSize).notifier)
              .onCardOneInteraction();
        },
        title: widget.coachData.name,
        titleColor: Theme.of(context).colorScheme.primary,
        count: widget.coachData.challenge,
        tag: widget.coachData.occupation,
        content: const ProfileDetails(),
        width: MediaQuery.of(context).size.width,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
        ),
      ),
    );
  }
}
