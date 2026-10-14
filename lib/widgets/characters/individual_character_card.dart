import 'dart:io';

import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/services/data_services.dart';
import 'package:dnddmcompanion/widgets/inputs/breathing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndividualCharacterCard extends StatefulWidget {
  final Character character;

  const IndividualCharacterCard({required this.character, Key? key})
      : super(key: key);

  @override
  _IndividualCharacterCardState createState() =>
      _IndividualCharacterCardState();
}

class _IndividualCharacterCardState extends State<IndividualCharacterCard> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController imageLocationString;
  late TextEditingController levelController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(
        text: widget.character.firstName.isNotEmpty
            ? widget.character.firstName
            : null);
    lastNameController = TextEditingController(
        text: widget.character.lastName.isNotEmpty
            ? widget.character.lastName
            : null);
    levelController =
        TextEditingController(text: widget.character.level?.toString() ?? '');
    imageLocationString = TextEditingController(
        text: (widget.character.iconLocation?.isNotEmpty ?? false)
            ? widget.character.iconLocation
            : null);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    imageLocationString.dispose();
    levelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: levelController,
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    decoration:
                        const InputDecoration(labelText: 'Level (optional)'),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      imageLocationString.text.isNotEmpty
                          ? SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.file(File(imageLocationString.text)))
                          : Container(),
                      //Button to change image
                      IconButton(
                          onPressed: () async {
                            //open image picker
                            DataServices().addCharacterImage().then((value) {
                              setState(() {
                                imageLocationString.text = value;
                              });
                            });
                          },
                          icon: const Icon(
                            Icons.image,
                          ))
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                BreathingButton(
                    text: 'Save Changes',
                    onPressed: () {
                      //pop dialog and send character back
                      final levelText = levelController.text.trim();
                      final level =
                          levelText.isEmpty ? null : int.tryParse(levelText);
                      if (levelText.isNotEmpty && level == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Enter a whole-number level, or leave it blank.')),
                        );
                        return;
                      }
                      Navigator.of(context).pop(widget.character.copyWith(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        iconLocation: imageLocationString.text.isEmpty
                            ? widget.character.iconLocation
                            : imageLocationString.text,
                        level: level,
                        clearLevel: levelText.isEmpty,
                      ));
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
