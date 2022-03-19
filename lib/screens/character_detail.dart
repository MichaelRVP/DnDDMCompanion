import 'package:dnddmcompanion/models/character.dart';
import 'package:flutter/material.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;

  const CharacterDetail({required this.character, Key? key}) : super(key: key);

  static const routeName = '/character';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Detail'),
      ),
      body: Column(children: [
        Row(
          children: [
            Image(
                image: AssetImage(
                    character.icon ?? character.defaultCharacter().icon!)),
          ],
        )
      ]),
    );
  }
}
