import 'package:adwatcher/controller/redux/action.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/util/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:adwatcher/view/rewards/level_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';
import 'package:redux/redux.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  final int xpGained = 4;

  @override
  Widget build(BuildContext context) {
    return Consumer<Character>(builder: (BuildContext context, character, Widget? child) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You have completed your watch!"),
              Text("You earned $xpGained xp"),
              ImageButton(
                text: "Collect rewards",
                image: ImageAssetProvider.greenButton,
                onPressed: () {
                  if (character.expToNextLevel <= character.currentLevelExp + xpGained) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) => const LevelUpScreen()),
                    );
                  } else {
                    Navigator.pop(context);
                  }

                  context.read<Store<AdWatcherState>>().dispatch(AddExperiencePoints(exp: xpGained));
                },
              ),
            ].addSpacing(size: 30),
          ),
        ),
      );
    });
  }
}
