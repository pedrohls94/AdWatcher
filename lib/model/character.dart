import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/role.dart';

class Character {
  Role role;
  int exp;
  Map<Attribute, int> attributes;

  Character({
    required this.role,
    required this.exp,
    required this.attributes,
  });
}
