import 'package:dnddmcompanion/widgets/maps/controls/wall_save_row.dart';
import 'package:dnddmcompanion/widgets/maps/grid_map/grid_map_wall_draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WallDrawWrapper extends ConsumerWidget {
  const WallDrawWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                flex: 82,
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: const GridMapWallDraw(),
                ),
              ),
              Expanded(
                flex: 18,
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: const WallSaveRow(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
