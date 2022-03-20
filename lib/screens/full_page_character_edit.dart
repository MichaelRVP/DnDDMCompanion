import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/character_detail.dart';
import 'package:flutter/material.dart';

class FullPageCharacterEdit extends StatefulWidget {
  final Character character;

  const FullPageCharacterEdit({required this.character, Key? key})
      : super(key: key);

  static const routeName = '/character';

  @override
  State<FullPageCharacterEdit> createState() => _FullPageCharacterEditState();
}

class _FullPageCharacterEditState extends State<FullPageCharacterEdit> {
  late Character character;

  @override
  void initState() {
    super.initState();
    character = widget.character.decouple(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                //where you would save the edited character
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: CharacterDetail(character: character),
    );
  }
}
