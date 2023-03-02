import 'package:challenge/features/coaches/coachDetail/components/challenges.dart';
import 'package:challenge/features/coaches/coachDetail/components/photos.dart';
import 'package:challenge/features/coaches/coachDetail/components/profile_details.dart';
import 'package:challenge/features/coaches/models/coach.dart';
import 'package:challenge/features/home/components/card.dart';
import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.coachData,
  });

  final Coach coachData;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      primary: true,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => context.pop(),
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.3),
            radius: 28,
            child: const Icon(
              IconlyLight.arrowLeft,
              color: Colors.white,
            ),
          ),
        ).animate().fadeIn().slideX(
            delay: defaultDuration, begin: 1, end: 0, curve: Curves.bounceOut),
      ),
      leadingWidth: 70,
      expandedHeight: MediaQuery.of(context).size.height,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Hero(
              tag: coachData.name,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  coachData.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: MediaQuery.of(context).size.height * 0.3,
              child: CustomCard(
                onVerticalDragStart: (dragDetails) {},
                title: coachData.name,
                titleColor: Theme.of(context).colorScheme.primary,
                count: coachData.challenge,
                tag: coachData.occupation,
                content: const ProfileDetails(),
                width: MediaQuery.of(context).size.width,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: MediaQuery.of(context).size.height * 0.45,
              child: CustomCard(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onVerticalDragStart: (dragDetails) {},
                title: "Available Challenges",
                count: coachData.challenge,
                tag: "Available Challenges",
                content: const Challenges(),
                width: MediaQuery.of(context).size.width,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: MediaQuery.of(context).size.height * 0.6,
              child: CustomCard(
                backgroundColor: Colors.black,
                onVerticalDragStart: (dragDetails) {},
                title: "Photos",
                count: coachData.challenge,
                tag: "Photos",
                content: const Photos(),
                width: MediaQuery.of(context).size.width,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
