import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/small_image_icon_card.dart';
import 'package:flutter/material.dart';

class SmallCharacterCard extends StatefulWidget {
  final Character character;
  final int totalCharacters;

  const SmallCharacterCard({
    required this.character,
    required this.totalCharacters,
    Key? key,
  }) : super(key: key);

  @override
  State<SmallCharacterCard> createState() => _SmallCharacterCardState();
}

class _SmallCharacterCardState extends State<SmallCharacterCard> {
  late bool selected;

  @override
  void initState() {
    super.initState();

    selected = false;
  }

  void _updateSize() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateSize(),
      child: LayoutBuilder(
        builder: ((context, constraints) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
            child: Container(
              decoration: BoxDecoration(
                  border: selected
                      ? Border.all(
                          width: 3,
                          color: Colors.blue,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(.9)),
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .7,
                    width: selected ? 300 : 200,
                    child:
                        SmallImageIconCard(imageString: widget.character.icon!),
                  ),
                  const Spacer(),
                  Text(
                    '  ${widget.character.firstName} ${widget.character.lastName}  ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
