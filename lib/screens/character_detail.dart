import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/image_icon_card.dart';
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
            SizedBox(
                width: 400,
                child: ImageIconCard(
                    imageString:
                        character.icon ?? character.defaultCharacter().icon!)),
          ],
        )
      ]),
    );
  }
}
