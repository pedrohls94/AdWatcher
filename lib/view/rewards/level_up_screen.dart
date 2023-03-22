import 'package:adwatcher/controller/redux/action.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/util/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:adwatcher/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';
import 'package:redux/redux.dart';

class LevelUpScreen extends StatelessWidget {
  const LevelUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Character>(builder: (BuildContext context, character, Widget? child) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Level UP!"),
              const SizedBox(
                height: 30,
              ),
              ...buildAttributeRowsFor(character, (attribute) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
                context.read<Store<AdWatcherState>>().dispatch(IncreaseAttribute(attribute: attribute));
              }),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> buildAttributeRowsFor(Character character, dynamic Function(Attribute attribute) onPressed) {
    List<Row> attributeRows = [];

    character.attributes.forEach((key, value) {
      attributeRows.add(buildAttributeRow(key, value, onPressed));
    });

    return attributeRows.addSpacing(size: 10);
  }

  Row buildAttributeRow(Attribute attribute, int attributeValue, dynamic Function(Attribute attribute) onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 30,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(attribute.shortName),
          ),
        ),
        SizedBox(
          width: 40,
          height: 30,
          child: Align(
            alignment: Alignment.center,
            child: Text("$attributeValue"),
          ),
        ),
        SizedBox(
          width: 40,
          height: 30,
          child: ImageButton(
            text: "",
            image: ImageAssetProvider.greenPlusButton,
            onPressed: () {
              onPressed(attribute);
            },
          ),
        ),
      ],
    );
  }
}
