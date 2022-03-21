import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/small_character_card.dart';
import 'package:flutter/material.dart';

class SmallCharacterRowList extends StatelessWidget {
  const SmallCharacterRowList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Character> characters = [
      Character().defaultCharacter(),
      Character().defaultCharacter(),
      Character().defaultCharacter(),
      Character().defaultCharacter(),
      Character().defaultCharacter(),
      Character().defaultCharacter(),
    ];

    return LayoutBuilder(
      builder: ((context, constraints) {
        return ListView.builder(
          itemCount: characters.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return SmallCharacterCard(
              character: characters[index],
              totalCharacters: characters.length,
            );
          }),
        );
      }),
    );
  }
}
