import 'package:adwatcher/model/attribute.dart';

enum Role {
  paladin,
  barbarian,
  ranger,
  wizard,
  druid,
  bard,
}

extension RoleExtension on Role {
  String get name {
    switch (this) {
      case Role.paladin:
        return "Paladin";
      case Role.barbarian:
        return "Barbarian";
      case Role.ranger:
        return "Ranger";
      case Role.wizard:
        return "Wizard";
      case Role.druid:
        return "Druid";
      case Role.bard:
        return "Bard";
    }
  }

  Map<Attribute, int> get startingAttributes {
    Map<Attribute, int> attributes = {
      Attribute.strength: 5,
      Attribute.dexterity: 5,
      Attribute.constitution: 5,
      Attribute.intelligence: 5,
      Attribute.wisdom: 5,
      Attribute.charisma: 5,
    };

    switch (this) {
      case Role.paladin:
        attributes[Attribute.strength] = 10;
        attributes[Attribute.constitution] = 8;
        break;
      case Role.barbarian:
        attributes[Attribute.constitution] = 10;
        attributes[Attribute.strength] = 8;
        break;
      case Role.ranger:
        attributes[Attribute.dexterity] = 10;
        attributes[Attribute.wisdom] = 8;
        break;
      case Role.wizard:
        attributes[Attribute.intelligence] = 10;
        attributes[Attribute.wisdom] = 8;
        break;
      case Role.druid:
        attributes[Attribute.wisdom] = 10;
        attributes[Attribute.constitution] = 8;
        break;
      case Role.bard:
        attributes[Attribute.charisma] = 10;
        attributes[Attribute.dexterity] = 8;
        break;
    }

    return attributes;
  }
}
