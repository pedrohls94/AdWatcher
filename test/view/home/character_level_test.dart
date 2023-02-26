import 'package:adwatcher/view/home/character_level.dart';
import 'package:test/test.dart';

void main() {
  test('Character level is correctly calculated when at level 0', () {
    final viewModel = CharacterLevelViewModel(5);

    expect(viewModel.level, 0);
    expect(viewModel.expToNextLevel, 10);
    expect(viewModel.currentLevelExp, 5);
  });

  test('Character level is correctly calculated with no extra xp', () {
    final viewModel = CharacterLevelViewModel(100);

    expect(viewModel.level, 4);
    expect(viewModel.expToNextLevel, 50);
    expect(viewModel.currentLevelExp, 0);
  });

  test('Character level is correctly calculated with some extra xp', () {
    final viewModel = CharacterLevelViewModel(134);

    expect(viewModel.level, 4);
    expect(viewModel.expToNextLevel, 50);
    expect(viewModel.currentLevelExp, 34);
  });
}
