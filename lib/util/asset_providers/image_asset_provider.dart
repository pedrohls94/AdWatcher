import 'package:adwatcher/model/role.dart';
import 'package:flutter/material.dart';

class ImageAssetProvider {
  static AssetImage blueButton = const AssetImage("assets/blue_button.png");
  static AssetImage selectedBlueButton = const AssetImage("assets/selected_blue_button.png");
  static AssetImage greenButton = const AssetImage("assets/green_button.png");
  static AssetImage greenPlusButton = const AssetImage("assets/green_plus_button.png");

  static Image barbarian = Image.asset("assets/dummy.png");
  static Image xpBarOutline = Image.asset("assets/xp_bar_outline.png");
  static Image achievementCardGray = Image.asset("assets/achievement_card_gray.png");
  static Image achievementCardCompleted = Image.asset("assets/achievement_card_completed.png");

  static Map<Role, Image> charImages = {
    Role.barbarian: Image.asset("assets/char_barbarian.png"),
    Role.paladin: Image.asset("assets/char_paladin.png"),
    Role.ranger: Image.asset("assets/char_ranger.png"),
    Role.druid: Image.asset("assets/char_druid.png"),
    Role.wizard: Image.asset("assets/char_wizard.png"),
    Role.bard: Image.asset("assets/char_bard.png"),
  };
}
