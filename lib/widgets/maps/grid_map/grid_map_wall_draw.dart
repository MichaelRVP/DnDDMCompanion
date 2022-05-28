import 'package:dnddmcompanion/main.dart';
import 'package:dnddmcompanion/models/grid_sizing.dart';
import 'package:dnddmcompanion/models/providers/grid_sizing_notifier.dart';
import 'package:dnddmcompanion/widgets/maps/cells/wall_grid_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridMapWallDraw extends ConsumerStatefulWidget {
  const GridMapWallDraw({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GridMapWallDrawState();
}

class _GridMapWallDrawState extends ConsumerState<GridMapWallDraw> {
  @override
  Widget build(BuildContext context) {
    GridSizing gridSizing = ref.watch(gridSizingNotifierProvider);

    final String imageString = ref.watch(selectedImageNotifier);

    return LayoutBuilder(
      builder: ((context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(80),
                  minScale: 0.5,
                  maxScale: 6,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          color: Colors.white.withOpacity(.8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              imageString,
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              gridSizing.leftCellPadding,
                              gridSizing.topCellPadding,
                              gridSizing.rightCellPadding,
                              gridSizing.bottomCellPadding),
                          child: GridView.count(
                            crossAxisCount: gridSizing.totalWidthCells.toInt(),
                            childAspectRatio: 1,
                            children: List.generate(
                                gridSizing.cellTotal.toInt(), (index) {
                              return WallGridCell(
                                index: index,
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
