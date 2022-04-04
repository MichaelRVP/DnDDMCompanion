import 'package:dnddmcompanion/widgets/maps/overlay_control_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayControlsRow extends ConsumerWidget {
  final int totalWidthCells;
  final int totalHeightCells;
  final double topCellPadding;
  final double bottomCellPadding;
  final double leftCellPadding;
  final double rightCellPadding;
  final double cellSizing;

  const OverlayControlsRow({
    Key? key,
    required this.bottomCellPadding,
    required this.cellSizing,
    required this.leftCellPadding,
    required this.rightCellPadding,
    required this.topCellPadding,
    required this.totalHeightCells,
    required this.totalWidthCells,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.withOpacity(.4)),
      child: Row(
        children: [
          OverlayControlBundle(
            incrementer: topCellPadding,
            hintText: 'Top',
          ),
          const Spacer(),
          OverlayControlBundle(
            incrementer: bottomCellPadding,
            hintText: 'Bottom',
          ),
          const Spacer(),
          OverlayControlBundle(
            incrementer: leftCellPadding,
            hintText: 'Left',
          ),
          const Spacer(),
          OverlayControlBundle(
            incrementer: rightCellPadding,
            hintText: 'Right',
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
    );
  }
}
