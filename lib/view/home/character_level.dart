import 'package:adwatcher/view/asset_providers/image_asset_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';
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
                  width: (200-12)*viewModel.currentLevelExp/viewModel.expToNextLevel,
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
  int totalExp;
  late int level;
  late int expToNextLevel;
  late int currentLevelExp;

  CharacterLevelViewModel(this.totalExp) {
    num delta = (25 + 20 * totalExp).abs();
    num x = (-5 + sqrt(delta)) / 10;

    level = x.floor();
    expToNextLevel = 10 + (level * 10);

    num expNeededToCurrentLevel = 5 * pow(level, 2) + 5 * level;
    currentLevelExp = totalExp - expNeededToCurrentLevel.floor();
  }
}

/*
a1 = 10
d = 10
an = a1 + (n-1)*10

Sn = n/2 * (n+1)*10

Sn = n*(n+1)*5 = 5n²+5n
f(x) = 5n²+5n-sum

delta = 25 + 20sum
x1 = (-5+(25+20sum)^(1/2))/10
x2 = (-5-(25+20sum)^(1/2))/10
*/