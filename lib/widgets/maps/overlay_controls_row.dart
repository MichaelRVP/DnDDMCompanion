import 'package:dnddmcompanion/models/grid_sizing.dart';
import 'package:dnddmcompanion/models/providers/grid_sizing_notifier.dart';
import 'package:dnddmcompanion/widgets/maps/overlay_control_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayControlsRow extends ConsumerWidget {
  const OverlayControlsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GridSizing gridSizing = ref.watch(gridSizingNotifierProvider);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.withOpacity(.4)),
      child: Row(
        children: [
          OverlayControlBundle(
            hintText: 'Top',
          ),
          const Spacer(),
          OverlayControlBundle(
            hintText: 'Bottom',
          ),
          const Spacer(),
          OverlayControlBundle(
            hintText: 'Left',
          ),
          const Spacer(),
          OverlayControlBundle(
            hintText: 'Right',
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              setState(() {
                widget.totalHeightCells--;
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
