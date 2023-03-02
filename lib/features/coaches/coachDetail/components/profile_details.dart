import 'package:challenge/features/coaches/coachDetail/providers/coach_detail_animation_status_provider.dart';
import 'package:challenge/features/home/components/chip_list.dart';
import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const About(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Expertise Area",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          ChipList(
            chipColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            scroll: false,
            chipList: const [
              "Yoga",
              "Health",
              "Diet",
              "Exercise",
              "Nutritions"
            ],
          ),
          const DegreeExperience(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
          )
        ],
      ),
    );
  }
}

class About extends ConsumerWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCardExpanded = ref
            .watch(cardAnimationStatusProvider(MediaQuery.of(context).size))
            .cardOneTop! <=
        MediaQuery.of(context).size.height * 0.2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            thickness: 0.5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.format_quote_sharp,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "I can help you to be fit through Yoga! maintain a healthy practice through a guided sequential course by me! ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            thickness: 0.5,
          ),
        ],
      ),
    )
        .animate(target: isCardExpanded ? 1 : 0)
        .fadeIn(duration: defaultDuration, curve: Curves.easeInOut);
  }
}

class DegreeExperience extends ConsumerWidget {
  const DegreeExperience({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCardExpanded = ref
            .watch(cardAnimationStatusProvider(MediaQuery.of(context).size))
            .cardOneTop! <=
        MediaQuery.of(context).size.height * 0.2;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Degrees and Experience",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "I'm a certified Yoga practioner, conducting Yoga workshops all over the world.",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
          )
        ],
      ),
    )
        .animate(target: isCardExpanded ? 1 : 0)
        .fadeIn(duration: defaultDuration, curve: Curves.easeInOut);
  }
}
