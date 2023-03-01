import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/model/character.dart';

class AdWatcherDatabaseMock implements AdWatcherDatabase {
  Character? savedCharacter;

  @override
  Character? fetchCharacter() {
    return savedCharacter;
  }

  @override
  void saveCharacter(Character character) {
    savedCharacter = character;
  }
}