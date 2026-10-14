import 'package:dnddmcompanion/main.dart';
import 'package:dnddmcompanion/models/grid_sizing.dart';
import 'package:dnddmcompanion/models/providers/grid_sizing_notifier.dart';
import 'package:dnddmcompanion/widgets/maps/cells/map_drag_target.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridMapGame extends ConsumerStatefulWidget {
  const GridMapGame({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<GridMapGame> createState() => _GridMapGameState();
}

class _GridMapGameState extends ConsumerState<GridMapGame> {
  final TransformationController _transformationController =
      TransformationController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _transformationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GridSizing gridSizing = ref.watch(gridSizingNotifierProvider);
    final String imageString = ref.watch(selectedImageNotifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              width: constraints.maxWidth - 32,
              height: constraints.maxHeight,
              child: InteractiveViewer(
                key: const ValueKey<String>('map-interactive-viewer'),
                transformationController: _transformationController,
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
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          gridSizing.leftCellPadding,
                          gridSizing.topCellPadding,
                          gridSizing.rightCellPadding,
                          gridSizing.bottomCellPadding,
                        ),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: gridSizing.totalWidthCells.toInt(),
                          childAspectRatio: 1,
                          children: List.generate(
                            gridSizing.cellTotal.toInt(),
                            (index) => MapDragTarget(
                              key: ValueKey<String>('map-cell-$index'),
                              xCord: index % gridSizing.totalWidthCells.toInt(),
                              yCord:
                                  index ~/ gridSizing.totalWidthCells.toInt(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
