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
}
