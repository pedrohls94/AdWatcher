import 'package:adwatcher/model/role.dart';

class CreateCharacterAction {
  String name;
  Role role;

  CreateCharacterAction({required this.name, required this.role});
}

class AddExperiencePoints {
  int exp;
  AddExperiencePoints({required this.exp});
}
