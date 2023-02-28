import 'package:adwatcher/model/character.dart';

abstract class AdWatcherDatabase {
  Character? fetchCharacter();
  void saveCharacter(Character character);
}

class AdWatcherDatabaseMock implements AdWatcherDatabase {
  static AdWatcherDatabaseMock? _db;
  static AdWatcherDatabaseMock sharedInstance() {
    _db ??= AdWatcherDatabaseMock();
    return _db!;
  }

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
