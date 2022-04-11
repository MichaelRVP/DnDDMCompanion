import 'package:dnddmcompanion/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapDragTarget extends ConsumerWidget {
  final int xCord;
  final int yCord;

  const MapDragTarget({required this.xCord, required this.yCord, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DragTarget(
      onAccept: (Character character) {},
      builder: ((context, candidateData, rejectedData) {
        return Container();
      }),
    );
  }
}

// Container(
//   decoration: BoxDecoration(
//       color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
//           .withOpacity(.4)));

