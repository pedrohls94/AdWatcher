import 'package:adwatcher/model/character.dart';

class Achievement {
  String title;
  String description;
  bool Function(Character character) condition;

  Achievement({required this.title, required this.description, required this.condition});
}

class AchievementLibrary {
  static List<Achievement> achievements = [
    Achievement(
      title: "You are working!",
      description: "Watch 8 ads in a single day",
      condition: (character) {
        return character.statistics.mostAdsWatchedInASingleDay >= 8;
      },
    ),
    Achievement(
      title: "Now that's hard work",
      description: "Watch 16 ads in a single day",
      condition: (character) {
        return character.statistics.mostAdsWatchedInASingleDay >= 16;
      },
    ),
    Achievement(
      title: "Do you even sleep?",
      description: "Watch 24 ads in a single day",
      condition: (character) {
        return character.statistics.mostAdsWatchedInASingleDay >= 24;
      },
    ),
    Achievement(
      title: "Did you click on any of them?",
      description: "Watch a total of 50 ads",
      condition: (character) {
        return character.statistics.adsWatched >= 50;
      },
    ),
    Achievement(
      title: "I think you like this!",
      description: "Watch a total of 100 ads",
      condition: (character) {
        return character.statistics.adsWatched >= 100;
      },
    ),
    Achievement(
      title: "You are my hero.",
      description: "Watch a total of 1000 ads",
      condition: (character) {
        return character.statistics.adsWatched >= 1000;
      },
    ),
    Achievement(
      title: "You feel incredibly strong!",
      description: "Reach character level 5",
      condition: (character) {
        return character.level >= 5;
      },
    ),
    Achievement(
      title: "I'm pretty sure you can fight a dragon.",
      description: "Reach character level 10",
      condition: (character) {
        return character.level >= 10;
      },
    ),
    Achievement(
      title: "No one ever got to this level!",
      description: "Reach character level 20",
      condition: (character) {
        return character.level >= 20;
      },
    ),
    Achievement(
      title: "You should have started with that.",
      description: "Get one attribute of your character to 15",
      condition: (character) {
        return character.attributes.values.any((value) => value >= 15);
      },
    ),
    Achievement(
      title: "Is that the limit?",
      description: "Get one attribute of your character to 20",
      condition: (character) {
        return character.attributes.values.any((value) => value >= 20);
      },
    ),
    Achievement(
      title: "How did you get that with no magic items?",
      description: "Get one attribute of your character to 30",
      condition: (character) {
        return character.attributes.values.any((value) => value >= 30);
      },
    ),
  ];
}
