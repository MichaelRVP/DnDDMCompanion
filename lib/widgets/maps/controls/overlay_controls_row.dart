import 'package:dnddmcompanion/screens/grid_map_game_screen.dart';
import 'package:dnddmcompanion/widgets/maps/controls/overlay_control_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayControlsRow extends ConsumerWidget {
  const OverlayControlsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.withOpacity(.4)),
      child: Row(
        children: [
          const OverlayControlBundle(
            hintText: 'Top',
            gridSizeOption: 'top',
          ),
          const Spacer(),
          const OverlayControlBundle(
            hintText: 'Bottom',
            gridSizeOption: 'bottom',
          ),
          const Spacer(),
          const OverlayControlBundle(
            hintText: 'Left',
            gridSizeOption: 'left',
          ),
          const Spacer(),
          const OverlayControlBundle(
            hintText: 'Right',
            gridSizeOption: 'right',
          ),
          const Spacer(),
          // const OverlayControlBundle(
          //   hintText: 'Height',
          //   gridSizeOption: 'height',
          // ),
          // const Spacer(),
          const OverlayControlBundle(
            hintText: 'Width',
            gridSizeOption: 'width',
          ),
          const Spacer(),
          const OverlayControlBundle(
            hintText: 'Size',
            gridSizeOption: 'cell',
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GridMapGameScreen(),
              ));
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
    );
  }
}
