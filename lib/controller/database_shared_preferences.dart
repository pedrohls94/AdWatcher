import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/model/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdWatcherSharedPreferencesDatabase implements AdWatcherDatabase {
  late final SharedPreferences prefs;
  static Future<AdWatcherSharedPreferencesDatabase> createDatabase2() async {
    final database = AdWatcherSharedPreferencesDatabase();
    database.prefs = await SharedPreferences.getInstance();
    return database;
  }

  @override
  Character? fetchCharacter() {
    // TODO: implement fetchCharacter
    throw UnimplementedError();
  }

  @override
  void saveCharacter(Character character) {
    
  }
}
