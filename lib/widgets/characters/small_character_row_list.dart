import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/characters/draggable_character_card.dart';
import 'package:flutter/material.dart';

class SmallCharacterRowList extends StatefulWidget {
  const SmallCharacterRowList({Key? key}) : super(key: key);

  @override
  State<SmallCharacterRowList> createState() => _SmallCharacterRowListState();
}

class _SmallCharacterRowListState extends State<SmallCharacterRowList> {
  late bool hidden;

  @override
  void initState() {
    super.initState();
    hidden = true;
  }

  @override
  Widget build(BuildContext context) {
    List<Character> characters = [
      Character().jillian(),
      Character().greg(),
      Character().gabby(),
      Character().npc(),
      Character().thom(),
      Character().james(),
      Character().tim(),
    ];

    List<Character> enemies = [
      //Character().defaultCharacter(),
      //Character().direWolf(),
    ];

    return LayoutBuilder(
      builder: ((context, constraints) {
        return Row(
          children: [
            const Spacer(),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: characters.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return DraggableCharacterCard(
                  character: characters[index],
                  totalCharacters: characters.length,
                );
              }),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  setState(() {
                    hidden = !hidden;
                  });
                },
                icon: const Icon(Icons.hide_image)),
            const Spacer(),
            !hidden
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: enemies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return DraggableCharacterCard(
                        character: enemies[index],
                        totalCharacters: enemies.length,
                      );
                    }),
                  )
                : Container(),
            const Spacer(),
          ],
        );
      }),
    );
  }
}
