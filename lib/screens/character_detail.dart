import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/image_icon_card.dart';
import 'package:dnddmcompanion/widgets/round_text_field.dart';
import 'package:flutter/material.dart';

class CharacterDetail extends StatefulWidget {
  final Character character;

  const CharacterDetail({required this.character, Key? key}) : super(key: key);

  static const routeName = '/character';

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  @override
  void initState() {
    super.initState();
    firstNameController =
        TextEditingController(text: widget.character.firstName);
    lastNameController = TextEditingController(text: widget.character.lastName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Detail'),
      ),
      body: Column(children: [
        Row(
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: ImageIconCard(
                  imageString: widget.character.icon ??
                      widget.character.defaultCharacter().icon!),
            ),
            const SizedBox(width: 50),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width - 500,
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
          ],
        )
      ]),
    );
  }
}
