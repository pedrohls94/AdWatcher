import 'package:adwatcher/controller/redux/action.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/role.dart';
import 'package:adwatcher/util/asset_providers/image_asset_provider.dart';
import 'package:adwatcher/view/character_creation/class_selection_buttons.dart';
import 'package:adwatcher/view/custom_widgets/button.dart';
import 'package:adwatcher/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class CharacterCreationScreen extends StatefulWidget {
  const CharacterCreationScreen({super.key});

  @override
  State<CharacterCreationScreen> createState() => _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
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
            ClassSelectionButtons(
                selectedRole: _selectedRole,
                onChanged: (role) {
                  setState(() {
                    _selectedRole = role;
                  });
                }),
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
            .read<Store<AdWatcherState>>()
            .dispatch(CreateCharacterAction(name: nameTextEditingController.text, role: _selectedRole));
        Navigator.push(
          context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => const HomeScreen()),
        );
      },
    );
  }
}