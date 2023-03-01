import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/model/role.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdWatcherSharedPreferencesDatabase implements AdWatcherDatabase {
  late final SharedPreferences prefs;
  static Future<AdWatcherSharedPreferencesDatabase> createDatabase2() async {
    final database = AdWatcherSharedPreferencesDatabase();
    database.prefs = await SharedPreferences.getInstance();
    return database;
  }

  final characterNameKey = "characterName";
  final characterRoleKey = "characterRole";
  final characterExpKey = "characterExp";
  final characterAttributesKey = "characterAttribute-";

  @override
  Future<Character?> fetchCharacter() async {
    final name = prefs.getString(characterNameKey);
    final roleName = prefs.getString(characterRoleKey);
    final exp = prefs.getInt(characterExpKey);

    if (name == null || roleName == null || exp == null) {
      return null;
    }

    Map<Attribute, int> attributes = {};
    for (var attribute in Attribute.values) {
      final attributeScore = prefs.getInt(characterAttributesKey + attribute.name);
      if (attributeScore == null) {
        return null;
      }

      attributes[attribute] = attributeScore;
    }

    final role = RoleFactory.fromName(roleName);
    return Character(name: name, role: role, exp: exp, attributes: attributes);
  }

  @override
  void saveCharacter(Character character) {
    prefs.setString(characterNameKey, character.name);
    prefs.setString(characterRoleKey, character.role.name);
    prefs.setInt(characterExpKey, character.exp);

    character.attributes.forEach((key, value) {
      prefs.setInt(characterAttributesKey + key.name, value);
    });
  }
}
