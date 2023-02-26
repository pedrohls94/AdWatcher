import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';
import 'package:flutter/material.dart';

class CharacterAttributes extends StatelessWidget {
  const CharacterAttributes({super.key, required this.attributes});
  final Map<Attribute, int> attributes;

  @override
  Widget build(BuildContext context) {
    Map<Attribute, int> leftAttributes = {
      Attribute.strength: attributes[Attribute.strength]!,
      Attribute.dexterity: attributes[Attribute.dexterity]!,
      Attribute.constitution: attributes[Attribute.constitution]!,
    };

    Map<Attribute, int> rightAttributes = {
      Attribute.intelligence: attributes[Attribute.intelligence]!,
      Attribute.wisdom: attributes[Attribute.wisdom]!,
      Attribute.charisma: attributes[Attribute.charisma]!,
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildAttributeTable(leftAttributes),
        buildAttributeTable(rightAttributes),
      ].addSpacing(size: 20),
    );
  }

  Row buildAttributeTable(Map<Attribute, int> attributeMap) {
    List<Widget> leftColumnChildren = [];
    List<Widget> rightColumnChildren = [];

    attributeMap.forEach((key, value) {
      leftColumnChildren.add(Text(key.shortName));
      rightColumnChildren.add(Text(value.toString().padLeft(2, '0')));
    });

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: leftColumnChildren.addSpacing(size: 5),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rightColumnChildren.addSpacing(size: 5),
        ),
      ].addSpacing(size: 3),
    );
  }
}