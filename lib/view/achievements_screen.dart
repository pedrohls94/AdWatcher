import 'package:adwatcher/model/achievement.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/util/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Consumer<Character>(builder: (BuildContext context, character, Widget? child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                buildAchievementsColumn(),
                ImageButton(
                  text: "Go back",
                  image: ImageAssetProvider.greenButton,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 40),
              ].addSpacing(size: 30),
            ),
          ),
        ),
      );
    });
  }

  Widget buildAchievementsColumn() {
    final achievements = AchievementLibrary.achievements;
    List<Widget> achievementCards = [];

    for (var achievement in achievements) {
      achievementCards.add(buildAchievementCard(achievement));
    }

    return Column(
      children: achievementCards.addSpacing(size: 10),
    );
  }

  Widget buildAchievementCard(Achievement achievement) {
    return SizedBox(
      width: 260,
      height: 90,
      child: Stack(
        children: [
          achievement.condition(character) ? ImageAssetProvider.achievementCardCompleted : ImageAssetProvider.achievementCardGray,
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(achievement.title,
                      textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(achievement.description, textAlign: TextAlign.center),
                ].addSpacing(size: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
