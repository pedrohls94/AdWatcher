import 'package:adwatcher/controller/redux/action.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/role.dart';
import 'package:adwatcher/view/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:adwatcher/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class CreateCharacterScreen extends StatefulWidget {
  const CreateCharacterScreen({super.key});

  @override
  State<CreateCharacterScreen> createState() => _CreateCharacterScreenState();
}

class _CreateCharacterScreenState extends State<CreateCharacterScreen> {
  final nameTextEditingController = TextEditingController();
  Role _selectedRole = Role.paladin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            characterNameTextField,
            characterSelectionButtons,
            buildCreateButton(context),
          ].addSpacing(size: 40),
        ),
      ),
    );
  }

  SizedBox get characterNameTextField {
    return SizedBox(
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
    );
  }

  ImageButton buildCreateButton(BuildContext context) {
    return ImageButton(
      text: "Create",
      image: ImageAssetProvider.greenButton,
      onPressed: () {
        context
            .read<Store<AppState>>()
            .dispatch(CreateCharacterAction(name: nameTextEditingController.text, role: _selectedRole));
        Navigator.push(
          context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => const HomeScreen()),
        );
      },
    );
  }

  Row get characterSelectionButtons {
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