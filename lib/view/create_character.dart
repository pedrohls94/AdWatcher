import 'package:adwatcher/model/role.dart';
import 'package:adwatcher/view/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';
import 'package:flutter/services.dart';

class CreateCharacterWidget extends StatelessWidget {
  CreateCharacterWidget({super.key});
  final nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 185,
              child: TextFormField(
                textAlign: TextAlign.center,
                inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(20)],
                controller: nameTextEditingController,
                decoration: const InputDecoration(
                  hintText: 'Character Name',
                  contentPadding: EdgeInsets.only(top: 25),
                ),
              ),
            ),
            const ClassSelectionButtonWidget(),
            ImageButton(text: "Create", image: ImageAssetProvider.greenButton),
          ].addSpacing(size: 40),
        ),
      ),
    );
  }
}

class ClassSelectionButtonWidget extends StatefulWidget {
  const ClassSelectionButtonWidget({super.key});

  @override
  State<ClassSelectionButtonWidget> createState() => _ClassSelectionButtonWidgetState();
}

class _ClassSelectionButtonWidgetState extends State<ClassSelectionButtonWidget> {
  Role _selectedRole = Role.paladin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: createClassButtons,
    );
  }

  List<Widget> get createClassButtons {
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
          isSelected: role == _selectedRole,
          onPressed: () {
            setState(() {
              _selectedRole = role;
            });
          }));
    }

    return Column(children: buttons.addSpacing(size: 10));
  }

  ImageButton classButtonFor({required Role role, required bool isSelected, required void Function() onPressed}) {
    AssetImage image = isSelected ? ImageAssetProvider.selectedBlueButton : ImageAssetProvider.blueButton;
    return ImageButton(text: role.name, image: image, onPressed: onPressed);
  }
}
