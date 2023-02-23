import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/model/role.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Character character = Character(
    role: Role.barbarian,
    exp: 1,
    attributes: {
      Attribute.strength: 9,
      Attribute.dexterity: 5,
      Attribute.constitution: 14,
      Attribute.intelligence: 10,
      Attribute.wisdom: 5,
      Attribute.charisma: 1,
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
            const CharacterHeader(),
            const CharacterAttributes(),
            const CharacterExp(),
            const SizedBox(height: 15),
            const HomeScreenButtons(),
          ].addSpacing(size: 15),
        ),
      ),
    );
  }
}

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("dummy.png");
  }
}

class CharacterHeader extends StatelessWidget {
  const CharacterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Character name"),
        Text("Class"),
      ],
    );
  }
}

class CharacterAttributes extends StatelessWidget {
  const CharacterAttributes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("TODO"),
      ],
    );
  }
}

class CharacterExp extends StatelessWidget {
  const CharacterExp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Level X"),
        Image.asset("fixedxp.png"),
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
        Container(
          width: 200,
          height: 30,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("greenbutton.png"), fit: BoxFit.contain),
          ),
          child: TextButton(
            child: const Text("Train"),
            onPressed: () {
              print("Test");
            },
          ),
        ),
        Container(
          width: 200,
          height: 30,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("bluebutton.png"), fit: BoxFit.contain),
          ),
          child: TextButton(
            child: const Text("Achievements"),
            onPressed: () {
              print("Test");
            },
          ),
        ),
      ],
    );
  }
}
