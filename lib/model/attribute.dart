enum Attribute {
  strength,
  dexterity,
  constitution,
  intelligence,
  wisdom,
  charisma,
}

extension AttributeExtension on Attribute {
  String get shortName {
    switch (this) {
      case Attribute.strength:
        return "STR";
      case Attribute.dexterity:
        return "DEX";
      case Attribute.constitution:
        return "CON";
      case Attribute.intelligence:
        return "INT";
      case Attribute.wisdom:
        return "WIS";
      case Attribute.charisma:
        return "CHA";
    }
  }
}
