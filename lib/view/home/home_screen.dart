import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/model/role.dart';
import 'package:adwatcher/view/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:adwatcher/view/home/character_attributes.dart';
import 'package:adwatcher/view/home/character_level.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Character character = Character(
    name: "Yasha",
    role: Role.barbarian,
    exp: 1010,
    attributes: {
      Attribute.strength: 18,
      Attribute.dexterity: 16,
      Attribute.constitution: 14,
      Attribute.intelligence: 12,
      Attribute.wisdom: 9,
      Attribute.charisma: 7,
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CharacterImage(),
            CharacterHeader(characterName: character.name, className: character.role.name),
            CharacterAttributes(attributes: character.attributes),
            CharacterLevel(viewModel: CharacterLevelViewModel(character.exp)),
            const SizedBox(height: 10),
            const HomeScreenButtons(),
          ].addSpacing(size: 15),
        ),
      ),
    );
  }
}

class CharacterImage extends StatelessWidget {
  const CharacterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("dummy.png");
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
  const HomeScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageButton(text: "Train", image: ImageAssetProvider.selectedBlueButton),
        ImageButton(text: "Achievements", image: ImageAssetProvider.blueButton),
      ],
    );
  }
}
