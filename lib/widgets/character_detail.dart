import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/attribute_grid.dart';
import 'package:dnddmcompanion/widgets/image_icon_card.dart';
import 'package:dnddmcompanion/widgets/round_text_field.dart';
import 'package:flutter/material.dart';

class CharacterDetail extends StatefulWidget {
  final Character character;

  const CharacterDetail({required this.character, Key? key}) : super(key: key);

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController speedController;
  late TextEditingController visionController;
  late TextEditingController armorClassController;
  late TextEditingController initiativeController;

  @override
  void initState() {
    super.initState();
    firstNameController =
        TextEditingController(text: widget.character.firstName);
    lastNameController = TextEditingController(text: widget.character.lastName);
    speedController =
        TextEditingController(text: widget.character.speed.toString());
    visionController =
        TextEditingController(text: widget.character.vision.toString());
    armorClassController =
        TextEditingController(text: widget.character.armorClass.toString());
    initiativeController =
        TextEditingController(text: widget.character.initiative.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(children: [
            Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth * .4,
                  height: constraints.maxWidth * .4,
                  child: ImageIconCard(
                      imageString: widget.character.icon ??
                          widget.character.defaultCharacter().icon!),
                ),
                const Spacer(),
                SizedBox(
                  height: constraints.maxWidth * .4,
                  width: constraints.maxWidth * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoundTextField(
                        controller: firstNameController,
                        dividerText: 'First Name',
                      ),
                      RoundTextField(
                        controller: lastNameController,
                        dividerText: 'Last Name',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            AttributeGrid(
              character: widget.character,
            ),
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundTextField(
                    widthInput: constraints.maxWidth * .4,
                    controller: speedController,
                    dividerText: 'Speed',
                  ),
                  RoundTextField(
                    widthInput: constraints.maxWidth * .4,
                    controller: visionController,
                    dividerText: 'Vision',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundTextField(
                    widthInput: MediaQuery.of(context).size.width * .4,
                    controller: armorClassController,
                    dividerText: 'ArmorClass',
                  ),
                  RoundTextField(
                    widthInput: MediaQuery.of(context).size.width * .4,
                    controller: initiativeController,
                    dividerText: 'Initiative',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ]);
        },
      ),
    );
  }
}
