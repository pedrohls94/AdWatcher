import 'package:adwatcher/controller/ad_controller.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/model/role.dart';
import 'package:adwatcher/util/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:adwatcher/view/home/character_attributes.dart';
import 'package:adwatcher/view/home/character_level.dart';
import 'package:adwatcher/view/rewards/rewards_screen.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';
import 'package:adwatcher/util/extensions/string_extension.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Character>(builder: (BuildContext context, character, Widget? child) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageAssetProvider.charImages[character.role]!,
              CharacterHeader(characterName: character.name, className: character.role.name.capitalize()),
              CharacterAttributes(attributes: character.attributes),
              CharacterLevel(viewModel: CharacterLevelViewModel(character)),
              const SizedBox(height: 10),
              HomeScreenButtons(character: character),
            ].addSpacing(size: 15),
          ),
        ),
      );
    });
  }
}

class CharacterHeader extends StatelessWidget {
  const CharacterHeader({super.key, required this.characterName, required this.className});
  final String characterName;
  final String className;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(characterName),
        Text(className),
      ],
    );
  }
}

class HomeScreenButtons extends StatelessWidget {
  HomeScreenButtons({super.key, required this.character});
  final Character character;
  final adController = AdController();

  @override
  Widget build(BuildContext context) {
    adController.createRewardedAd();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageButton(
          text: "Play",
          image: ImageAssetProvider.greenButton,
          onPressed: () {
            adController.showRewardedAd(() {
              Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (_, __, ___) => const RewardsScreen()),
              );
            });
          },
        ),
        ImageButton(text: "Achievements", image: ImageAssetProvider.blueButton),
      ],
    );
  }
}
