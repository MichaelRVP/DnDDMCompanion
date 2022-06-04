import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/characters/draggable_character_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapDragTarget extends ConsumerStatefulWidget {
  final int xCord;
  final int yCord;

  const MapDragTarget({required this.xCord, required this.yCord, Key? key})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapDragTargetState();
}

class _MapDragTargetState extends ConsumerState<MapDragTarget> {
  late Character gridCharacter;

  @override
  void initState() {
    super.initState();

    gridCharacter = Character();
    gridCharacter.firstName = '';
  }

  @override
  Widget build(BuildContext context) {
    return //Container(
        // color: gridCharacter.isInSight(
        //         widget.xCord,
        //         widget.yCord,
        //         ref.read(gridSizingNotifierProvider).wallMap,
        //         ref.read(gridSizingNotifierProvider).totalWidthCells)
        //     ? Colors.black.withOpacity(0)
        //     : Colors.black.withOpacity(.3),
        //child:
        DragTarget(
      onAccept: (Character character) {
        setState(() {
          gridCharacter = character;
        });
      },
      onLeave: (Character? character) {
        setState(() {
          gridCharacter = Character();
          gridCharacter.firstName = '';
        });
      },
      builder: ((context, candidateData, rejectedData) {
        return gridCharacter.firstName != ''
            ? DraggableCharacterImage(character: gridCharacter)
            : Container();
      }),
    );
    //);
  }
}

// Container(
//   decoration: BoxDecoration(
//       color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
//           .withOpacity(.4)));
