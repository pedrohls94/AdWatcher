import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/role.dart';
import 'dart:math';

import 'package:adwatcher/model/statistics.dart';

class Character {
  String name;
  Role role;
  int exp;
  Map<Attribute, int> attributes;
  Statistics statistics;

  late int level;
  late int expToNextLevel;
  late int currentLevelExp;

  Character({required this.name, required this.role, required this.exp, required this.attributes, required this.statistics}) {
    initCalculatedVariables();
  }

  Character.newlyCreated({required this.name, required this.role})
      : exp = 0,
        attributes = role.startingAttributes,
        statistics = Statistics() {
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

  ///  Level progression:
  ///  The amount of experience points required to reach a level N is defined by an arithmetic progression, where:
  ///  EXP required to reach level 1: a1 = 10
  ///  Difference in EXP required to reach each subsequent level: d = 10
  ///  
  ///  Formulas:
  ///  EXP needed to level up from n-1 to n: an = a1 + (n - 1)*d = 10 + (n - 1)*10
  ///  Total EXP required for a character to be at level n: Sn = n/2 * (n+1)*10 = 5n² + 5n
  ///  Function to find character level based on total EXP: f(n) = 5n² + 5n - exp
  void initCalculatedVariables() {
    num delta = (25 + 20 * exp).abs();
    num x = (-5 + sqrt(delta)) / 10;

    level = x.floor();
    expToNextLevel = 10 + (level * 10);

    num expNeededToCurrentLevel = 5 * pow(level, 2) + 5 * level;
    currentLevelExp = exp - expNeededToCurrentLevel.floor();
  }
}
