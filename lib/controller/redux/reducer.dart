import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/controller/redux/action.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/character.dart';

AppState reducer(AppState state, Object? action) {
  if (action is CreateCharacterAction) {
    Character character = Character.newlyCreated(name: action.name, role: action.role);
    return AppState(character: character);
  }

  if (action is AddExperiencePoints) {
    Character savedChar = AdWatcherDatabaseMock.sharedInstance().fetchCharacter()!;
    Character character = Character(
        name: savedChar.name, role: savedChar.role, exp: savedChar.exp + action.exp, attributes: savedChar.attributes);
    return AppState(character: character);
  }

  return state;
}
