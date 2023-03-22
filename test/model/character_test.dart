import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/model/role.dart';
import 'package:test/test.dart';

void main() {
  test('Character level is correctly calculated when at level 0', () {
    final viewModel = Character(name: "test", role: Role.barbarian, exp: 5, attributes: {});

    expect(viewModel.level, 0);
    expect(viewModel.expToNextLevel, 10);
    expect(viewModel.currentLevelExp, 5);
  });

  test('Character level is correctly calculated with no extra xp', () {
    final viewModel = Character(name: "test", role: Role.barbarian, exp: 100, attributes: {});

    expect(viewModel.level, 4);
    expect(viewModel.expToNextLevel, 50);
    expect(viewModel.currentLevelExp, 0);
  });

  test('Character level is correctly calculated with some extra xp', () {
    final viewModel = Character(name: "test", role: Role.barbarian, exp: 134, attributes: {});

    expect(viewModel.level, 4);
    expect(viewModel.expToNextLevel, 50);
    expect(viewModel.currentLevelExp, 34);
  });
}
