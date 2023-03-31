import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/role.dart';

class CreateCharacterAction {
  String name;
  Role role;

  CreateCharacterAction({required this.name, required this.role});
}

class HandOutAdRewards {
  HandOutAdRewards();
}

class IncreaseAttribute {
  Attribute attribute;
  IncreaseAttribute({required this.attribute});
}
