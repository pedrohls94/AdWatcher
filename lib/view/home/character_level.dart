import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/util/asset_providers/image_asset_provider.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';

class CharacterLevel extends StatelessWidget {
  const CharacterLevel({super.key, required this.viewModel});
  final CharacterLevelViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Level ${viewModel.level}"),
        SizedBox(
          width: 200,
          height: 15,
          child: Stack(
            children: [
              Positioned(
                left: 8,
                top: 3,
                child: Container(
                  color: Colors.yellowAccent,
                  width: (200 - 12) * viewModel.currentLevelExp / viewModel.expToNextLevel,
                  height: 9,
                ),
              ),
              ImageAssetProvider.xpBarOutline,
            ],
          ),
        ),
      ].addSpacing(size: 5),
    );
  }
}

class CharacterLevelViewModel {
  late int level;
  late int expToNextLevel;
  late int currentLevelExp;

  CharacterLevelViewModel(Character character) {
    level = character.level;
    expToNextLevel = character.expToNextLevel;
    currentLevelExp = character.currentLevelExp;
  }
}
