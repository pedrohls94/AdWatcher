import 'package:adwatcher/controller/redux/action.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/attribute.dart';
import 'package:adwatcher/model/character.dart';

AdWatcherState reducer(AdWatcherState state, Object? action) {
  if (action is CreateCharacterAction) {
    Character character = Character.newlyCreated(name: action.name, role: action.role);
    return AdWatcherState(character: character);
  }

  if (action is AddExperiencePoints) {
    Character savedChar = state.character!;
    Character character = Character(
        name: savedChar.name, role: savedChar.role, exp: savedChar.exp + action.exp, attributes: savedChar.attributes);
    return AdWatcherState(character: character);
  }

  if (action is IncreaseAttribute) {
    Character savedChar = state.character!;
    Map<Attribute, int> newAttributes = savedChar.attributes;
    newAttributes[action.attribute] = newAttributes[action.attribute]! + 1;
    Character character =
        Character(name: savedChar.name, role: savedChar.role, exp: savedChar.exp, attributes: newAttributes);
    return AdWatcherState(character: character);
  }

  return state;
}
