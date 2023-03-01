import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/role.dart';

class Character {
  String name;
  Role role;
  int exp;
  Map<Attribute, int> attributes;

  Character({required this.name, required this.role, required this.exp, required this.attributes});
  Character.newlyCreated({required this.name, required this.role})
      : exp = 0,
        attributes = role.startingAttributes;

  @override
  bool operator ==(covariant Character other) {
    return hashCode == other.hashCode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ role.hashCode ^ exp.hashCode ^ attributes.hashCode;
  }
}
