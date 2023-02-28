import 'package:adwatcher/model/role.dart';
import 'package:adwatcher/view/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';

class ClassSelectionButtons extends StatelessWidget {
  const ClassSelectionButtons({super.key, required this.selectedRole, required this.onChanged});
  final Role selectedRole;
  final void Function(Role) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: createClassButtons(),
    );
  }

  List<Widget> createClassButtons() {
    List<Role> leftClasses = [Role.paladin, Role.barbarian, Role.ranger];
    List<Role> rightClasses = [Role.wizard, Role.druid, Role.bard];

    return [
      buildClassButtonsColumn(leftClasses),
      buildClassButtonsColumn(rightClasses),
    ];
  }

  Column buildClassButtonsColumn(List<Role> classes) {
    List<Widget> buttons = [];
    for (var role in classes) {
      buttons.add(classButtonFor(
          role: role,
          isSelected: role == selectedRole,
          onPressed: () {
            onChanged(role);
          }));
    }

    return Column(children: buttons.addSpacing(size: 10));
  }

  ImageButton classButtonFor({required Role role, required bool isSelected, required void Function() onPressed}) {
    AssetImage image = isSelected ? ImageAssetProvider.selectedBlueButton : ImageAssetProvider.blueButton;
    return ImageButton(text: role.name, image: image, onPressed: onPressed);
  }
}
