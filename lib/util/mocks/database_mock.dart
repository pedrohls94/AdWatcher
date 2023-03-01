import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/model/character.dart';

class AdWatcherDatabaseMock implements AdWatcherDatabase {
  Character? savedCharacter;

  @override
  Future<Character?> fetchCharacter() async {
    return savedCharacter;
  }

  @override
  void saveCharacter(Character character) {
    savedCharacter = character;
  }
}