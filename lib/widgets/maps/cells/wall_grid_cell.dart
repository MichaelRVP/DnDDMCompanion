import 'package:dnddmcompanion/models/grid_sizing.dart';
import 'package:dnddmcompanion/models/providers/grid_sizing_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WallGridCell extends ConsumerWidget {
  final int index;

  const WallGridCell({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GridSizing gridSizing = ref.watch(gridSizingNotifierProvider);

    bool wall = false;

    if (gridSizing.wallMap.containsKey(index)) {
      wall = gridSizing.wallMap[index]!;
    }

    return GestureDetector(
      onTap: () {
        GridSizing bufferSizing = gridSizing.copyWith();

        if (bufferSizing.wallMap.isEmpty) {
          bufferSizing = bufferSizing.copyWith(wallMap: {});
        }

        if (bufferSizing.wallMap[index] != null) {
          bufferSizing.wallMap[index] = !wall;
        } else {
          bufferSizing.wallMap.addAll({index: !wall});
        }

        ref.read(gridSizingNotifierProvider.notifier).updateGrid(bufferSizing);
      },
      child: Container(
        color:
            wall ? Colors.black.withOpacity(.3) : Colors.black.withOpacity(0),
      ),
    );
  }
}
