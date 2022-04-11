import 'package:dnddmcompanion/models/grid_sizing.dart';
import 'package:dnddmcompanion/models/providers/grid_sizing_notifier.dart';
import 'package:dnddmcompanion/widgets/maps/overlay_controls_row.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridMapOverlay extends ConsumerWidget {
  final String imageString;

  const GridMapOverlay({
    required this.imageString,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GridSizing gridSizing = ref.watch(gridSizingNotifierProvider);

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
                              height: constraints.maxHeight * .8,
                              width: constraints.maxWidth,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .8,
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
                              return GestureDetector(
                                onTap: () {
                                  //TODO get the x y from this
                                  print(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color((math.Random().nextDouble() *
                                                  0xFFFFFF)
                                              .toInt())
                                          .withOpacity(.4)),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                ),
                const OverlayControlsRow(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
