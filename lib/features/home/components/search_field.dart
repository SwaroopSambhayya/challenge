import 'package:challenge/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.all(0).copyWith(left: 20, right: 50),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "Enter topic, trainers or keywords",
                fillColor: Theme.of(context).primaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                radius: 25,
                child: Center(
                  child: Icon(
                    IconlyLight.search,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
          ).animate().shake(
              delay: defaultDuration,
              duration: defaultDuration,
              curve: Curves.easeInOut)
        ],
      ),
    ).animate().slideX(
        begin: 1, end: 0, duration: defaultDuration, curve: Curves.easeInOut);
  }
}
