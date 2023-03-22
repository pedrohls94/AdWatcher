import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/role.dart';
import 'dart:math';

class Character {
  String name;
  Role role;
  int exp;
  Map<Attribute, int> attributes;

  late int level;
  late int expToNextLevel;
  late int currentLevelExp;

  Character({required this.name, required this.role, required this.exp, required this.attributes}) {
    initCalculatedVariables();
  }

  Character.newlyCreated({required this.name, required this.role})
      : exp = 0,
        attributes = role.startingAttributes {
    initCalculatedVariables();
  }

  @override
  bool operator ==(covariant Character other) {
    return hashCode == other.hashCode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ role.hashCode ^ exp.hashCode ^ attributes.hashCode;
  }

  initCalculatedVariables() {
    num delta = (25 + 20 * exp).abs();
    num x = (-5 + sqrt(delta)) / 10;

    level = x.floor();
    expToNextLevel = 10 + (level * 10);

    num expNeededToCurrentLevel = 5 * pow(level, 2) + 5 * level;
    currentLevelExp = exp - expNeededToCurrentLevel.floor();

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
  }
}
