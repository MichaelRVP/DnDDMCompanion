import 'package:dnddmcompanion/widgets/maps/draggable_map.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class GridMapOverlay extends StatefulWidget {
  final String imageString;

  const GridMapOverlay({
    required this.imageString,
    Key? key,
  }) : super(key: key);

  @override
  State<GridMapOverlay> createState() => _GridMapOverlayState();
}

class _GridMapOverlayState extends State<GridMapOverlay> {
  late int totalWidthCells;
  late int totalHeightCells;
  late double topCellPadding;
  late double leftCellPadding;
  late double cellSizing;

  @override
  void initState() {
    super.initState();
    totalHeightCells = 42;
    totalWidthCells = 66;
    topCellPadding = 50;
    leftCellPadding = 16;
    cellSizing = 10;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SizedBox(
          width: constraints.maxWidth * .8,
          child: Column(
            children: [
              InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(80),
                minScale: 0.5,
                maxScale: 4,
                child: Stack(
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
                            widget.imageString,
                            height: 700,
                            width: constraints.maxWidth * .8,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .8,
                      height: 732,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(leftCellPadding,
                            topCellPadding, leftCellPadding, topCellPadding),
                        child: GridView.count(
                          crossAxisCount: totalWidthCells,
                          childAspectRatio: 1,
                          children: List.generate(
                              totalWidthCells * totalHeightCells, (index) {
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.withOpacity(.4)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          topCellPadding > 0 ? topCellPadding-- : null;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$topCellPadding'),
                    const Text(' Top Padding'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          topCellPadding++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          leftCellPadding > 0 ? leftCellPadding-- : null;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$leftCellPadding'),
                    const Text(' Left Padding'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          leftCellPadding++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          totalHeightCells--;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$totalHeightCells'),
                    const Icon(
                      Icons.unfold_more,
                      size: 40,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          totalHeightCells++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          totalWidthCells--;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$totalWidthCells'),
                    Transform.rotate(
                      angle: radians(90),
                      child: const Icon(
                        Icons.unfold_more,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          totalWidthCells++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.save,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
