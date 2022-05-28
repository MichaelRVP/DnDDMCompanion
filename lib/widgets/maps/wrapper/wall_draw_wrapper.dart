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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width,
              child: const GridMapWallDraw()),
          SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width,
              child: const WallSaveRow()),
        ],
      ),
    );
  }
}
