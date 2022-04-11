import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/images/small_image_icon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraggableCharacterImage extends ConsumerWidget {
  final Character character;

  const DraggableCharacterImage({
    required this.character,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Draggable<Character>(
      data: character,
      childWhenDragging: Container(),
      feedback: SizedBox(
        width: 20,
        height: 20,
        child: Center(
          child: SmallImageIconCard(
            imageString: character.icon!,
          ),
        ),
      ),
      child: SizedBox(
        width: 20,
        height: 20,
        child: Center(
          child: SmallImageIconCard(
            imageString: character.icon!,
          ),
        ),
      ),
    );
  }
}
