import 'package:flutter/material.dart';
import 'package:adwatcher/util/extensions/list_extension.dart';

class CreateCharacterWidget extends StatelessWidget {
  const CreateCharacterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const ClassSelectionButton(text: "Paladin",),
                  const ClassSelectionButton(text: "Barbarian",),
                  const ClassSelectionButton(text: "Ranger",),
                ].addSpacing(size: 10),
              ),
              Column(
                children: const [
                  ClassSelectionButton(text: "Wizard",),
                  ClassSelectionButton(text: "Druid",),
                  ClassSelectionButton(text: "Bard",),
                ].addSpacing(size: 10),
              ),
            ],
          ),
          Container(
            width: 200,
            height: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("greenbutton.png"), fit: BoxFit.contain),
            ),
            child: TextButton(
              child: const Text("Next"),
              onPressed: () {
                print("Test");
              },
            ),
          ),
        ].addSpacing(size: 40),
      ),
    );
  }
}

class ClassSelectionButton extends StatelessWidget {
  const ClassSelectionButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 30,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("bluebutton.png"), fit: BoxFit.contain),
      ),
      child: TextButton(
        child: Text(text),
        onPressed: () {
          print(text);
        },
      ),
    );
  }
}
