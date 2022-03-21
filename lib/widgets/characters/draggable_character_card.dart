import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/characters/empty_small_card.dart.dart';
import 'package:dnddmcompanion/widgets/characters/small_character_card.dart';
import 'package:dnddmcompanion/widgets/images/small_image_icon_card.dart';
import 'package:flutter/material.dart';

class DraggableCharacterCard extends StatelessWidget {
  final Character character;
  final int totalCharacters;

  const DraggableCharacterCard({
    required this.character,
    required this.totalCharacters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      childWhenDragging: EmptySmallCard(
        totalCharacters: totalCharacters,
      ),
      feedback: SizedBox(
        width: 150,
        height: 150,
        child: Center(
          child: SmallImageIconCard(
            imageString: character.icon!,
          ),
        ),
      ),
      child: SmallCharacterCard(
        character: character,
        totalCharacters: totalCharacters,
      ),
    );
  }
}
