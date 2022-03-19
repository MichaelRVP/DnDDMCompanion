import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/character_detail.dart';
import 'package:flutter/material.dart';

class FullPageCharacterEdit extends StatelessWidget {
  final Character character;

  const FullPageCharacterEdit({required this.character, Key? key})
      : super(key: key);

  static const routeName = '/character';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CharacterDetail(character: character),
    );
  }
}
