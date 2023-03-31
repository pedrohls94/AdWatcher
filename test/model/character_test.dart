import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/model/role.dart';
import 'package:adwatcher/model/statistics.dart';
import 'package:test/test.dart';

void main() {
  test('Character level is correctly calculated when at level 0', () {
    final character = Character(name: "test", role: Role.barbarian, exp: 5, attributes: {}, statistics: Statistics());

    expect(character.level, 0);
    expect(character.expToNextLevel, 10);
    expect(character.currentLevelExp, 5);
  });

  test('Character level is correctly calculated with no extra xp', () {
    final character = Character(name: "test", role: Role.barbarian, exp: 100, attributes: {}, statistics: Statistics());

    expect(character.level, 4);
    expect(character.expToNextLevel, 50);
    expect(character.currentLevelExp, 0);
  });

  test('Character level is correctly calculated with some extra xp', () {
    final character = Character(name: "test", role: Role.barbarian, exp: 134, attributes: {}, statistics: Statistics());

    expect(character.level, 4);
    expect(character.expToNextLevel, 50);
    expect(character.currentLevelExp, 34);
  });
}
