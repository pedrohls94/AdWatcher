import 'package:adwatcher/model/character.dart';

abstract class AdWatcherDatabase {
  Future<Character?> fetchCharacter();
  void saveCharacter(Character character);
}
