import 'package:dnddmcompanion/main.dart';
import 'package:dnddmcompanion/widgets/loading.dart';
import 'package:dnddmcompanion/widgets/maps/grid_map/grid_map_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridOverlayGameWrapper extends ConsumerWidget {
  const GridOverlayGameWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String imageString = ref.watch(selectedImageNotifier);

    if (imageString != '') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Flexible(child: GridMapGame()),
        ],
      );
    } else {
      return const Loading();
    }
  }
}
