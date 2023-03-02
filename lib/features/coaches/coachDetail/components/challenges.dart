import 'package:challenge/features/coaches/coachDetail/models/challenge.dart';
import 'package:challenge/features/coaches/coachDetail/providers/coach_detail_animation_status_provider.dart';
import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Challenges extends StatelessWidget {
  const Challenges({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          itemCount: challenges.length,
          itemBuilder: (context, index) {
            if (index == challenges.length - 1) {
              return Column(
                children: [
                  ChallengePost(challenge: challenges[index]),
                  const SizedBox(
                    height: 100,
                  )
                ],
              );
            }

            return ChallengePost(
              challenge: challenges[index],
            );
          }),
    );
  }
}

class ChallengePost extends ConsumerWidget {
  final Challenge challenge;
  const ChallengePost({super.key, required this.challenge});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCardExpanded = ref
            .watch(cardAnimationStatusProvider(MediaQuery.of(context).size))
            .cardTwoTop! <=
        MediaQuery.of(context).size.height * 0.21;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FadeIn(
        playAnimation: isCardExpanded,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.network(
                  challenge.imageUrl,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              challenge.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challenge.startDate,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(0.5)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10)
                        .copyWith(top: 8),
                    child: Icon(
                      Icons.circle,
                      size: 5,
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.5),
                    ),
                  ),
                  Text(
                    "\$${challenge.cost}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color!
                              .withOpacity(0.5),
                        ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Chip(
                        backgroundColor: Theme.of(context).primaryColor,
                        label: Text(
                          challenge.category,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple[200],
                                  ),
                        ),
                      ).animate(target: isCardExpanded ? 1 : 0).slideX(
                            begin: 1,
                            end: 0,
                            duration: Duration(
                                milliseconds:
                                    defaultDuration.inMilliseconds - 200),
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FadeIn extends StatelessWidget {
  final Widget child;
  final bool playAnimation;
  const FadeIn({super.key, required this.child, this.playAnimation = false});

  @override
  Widget build(BuildContext context) {
    return child
        .animate(target: playAnimation ? 1 : 0)
        .fadeIn(duration: defaultDuration, curve: Curves.easeInOut);
  }
}
