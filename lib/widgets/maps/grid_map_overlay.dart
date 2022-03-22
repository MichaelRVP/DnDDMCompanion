import 'package:dnddmcompanion/widgets/maps/draggable_map.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalHeightCells = 40;
    totalWidthCells = 73;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SizedBox(
          width: constraints.maxWidth * .8,
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(80),
            minScale: 0.5,
            maxScale: 4,
            child: Column(
              children: [
                Stack(
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
                      child: GridView.count(
                        crossAxisCount: totalWidthCells,
                        children: List.generate(
                            totalWidthCells * totalHeightCells, (index) {
                          return GestureDetector(
                            onTap: () {
                              print(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(.3)),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.withOpacity(.4)),
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            totalHeightCells--;
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
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
          ),
        );
      }),
    );
  }
}
