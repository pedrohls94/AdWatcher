import 'package:adwatcher/model/character.dart';

abstract class AdWatcherDatabase {
  Character? fetchCharacter();
  void saveCharacter(Character character);
}
