import 'package:adwatcher/controller/redux/action.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/util/ad_helper.dart';
import 'package:adwatcher/util/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:adwatcher/view/home/character_attributes.dart';
import 'package:adwatcher/view/home/character_level.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';
import 'package:adwatcher/util/extensions/string_extension.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

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
              const CharacterImage(),
              CharacterHeader(characterName: character.name, className: character.role.name.capitalize()),
              CharacterAttributes(attributes: character.attributes),
              CharacterLevel(viewModel: CharacterLevelViewModel(character.exp)),
              const SizedBox(height: 10),
              HomeScreenButtons(),
            ].addSpacing(size: 15),
          ),
        ),
      );
    });
  }
}

class CharacterImage extends StatelessWidget {
  const CharacterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageAssetProvider.dummy;
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
  HomeScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    _createRewardedAd();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageButton(
          text: "Play",
          image: ImageAssetProvider.greenButton,
          onPressed: () {
            _showRewardedAd(() {
              context.read<Store<AdWatcherState>>().dispatch(AddExperiencePoints(exp: 4));
            });
          },
        ),
        ImageButton(text: "Achievements", image: ImageAssetProvider.blueButton),
      ],
    );
  }

  static final AdRequest request = AdRequest();

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;
  int maxFailedLoadAttempts = 1;

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.testingAdUnitId,
      request: request,
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('$ad loaded.');
          _rewardedAd = ad;
          _numRewardedLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd failed to load: $error');
          _rewardedAd = null;
          _numRewardedLoadAttempts += 1;
          if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
            _createRewardedAd();
          }
        },
      ),
    );
  }

  void _showRewardedAd(void Function() onReward) {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      onReward();
    });
    _rewardedAd = null;
  }
}
