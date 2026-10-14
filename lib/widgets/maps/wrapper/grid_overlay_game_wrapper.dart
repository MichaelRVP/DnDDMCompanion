import 'package:dnddmcompanion/main.dart';
import 'package:dnddmcompanion/widgets/characters/small_character_row_list.dart';
import 'package:dnddmcompanion/widgets/loading.dart';
import 'package:dnddmcompanion/widgets/maps/grid_map/grid_map_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridOverlayGameWrapper extends ConsumerStatefulWidget {
  const GridOverlayGameWrapper({Key? key}) : super(key: key);

  @override
  ConsumerState<GridOverlayGameWrapper> createState() =>
      _GridOverlayGameWrapperState();
}

class _GridOverlayGameWrapperState
    extends ConsumerState<GridOverlayGameWrapper> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final String imageString = ref.watch(selectedImageNotifier);

    if (imageString == '') {
      return const Loading();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final double characterHeight = constraints.maxHeight * .18;

        return Stack(
          children: [
            Positioned.fill(
              bottom: _expanded ? 0 : characterHeight,
              child: SizedBox(
                key: const ValueKey<String>('game-map-region'),
                child: const GridMapGame(
                  key: ValueKey<String>('game-map'),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: characterHeight,
              child: Offstage(
                offstage: _expanded,
                child: const SizedBox(
                  key: ValueKey<String>('character-row-region'),
                  child: SmallCharacterRowList(
                    key: ValueKey<String>('character-row'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 24,
              child: Material(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(24),
                child: IconButton(
                  key: const ValueKey<String>('map-expand-toggle'),
                  tooltip: _expanded ? 'Restore map layout' : 'Expand map',
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  icon: Icon(
                    _expanded ? Icons.fullscreen_exit : Icons.fullscreen,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
