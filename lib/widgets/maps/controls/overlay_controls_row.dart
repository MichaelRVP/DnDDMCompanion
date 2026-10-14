import 'package:dnddmcompanion/widgets/maps/controls/overlay_control_bundle.dart';
import 'package:dnddmcompanion/widgets/maps/wrapper/wall_draw_wrapper.dart';
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const OverlayControlBundle(
              hintText: 'Top',
              gridSizeOption: 'top',
            ),
            const SizedBox(width: 16),
            const OverlayControlBundle(
              hintText: 'Bottom',
              gridSizeOption: 'bottom',
            ),
            const SizedBox(width: 16),
            const OverlayControlBundle(
              hintText: 'Left',
              gridSizeOption: 'left',
            ),
            const SizedBox(width: 16),
            const OverlayControlBundle(
              hintText: 'Right',
              gridSizeOption: 'right',
            ),
            const SizedBox(width: 16),
            // const OverlayControlBundle(
            //   hintText: 'Height',
            //   gridSizeOption: 'height',
            // ),
            // const SizedBox(width: 16),
            const OverlayControlBundle(
              hintText: 'Width',
              gridSizeOption: 'width',
            ),
            const SizedBox(width: 16),
            const OverlayControlBundle(
              hintText: 'Size',
              gridSizeOption: 'cell',
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WallDrawWrapper(),
                ));
              },
              icon: const Icon(
                Icons.save,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
