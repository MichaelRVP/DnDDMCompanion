import 'package:dnddmcompanion/main.dart';
import 'package:dnddmcompanion/widgets/loading.dart';
import 'package:dnddmcompanion/widgets/maps/controls/overlay_controls_row.dart';
import 'package:dnddmcompanion/widgets/maps/grid_map/grid_map_importer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridOverlayMapWrapper extends ConsumerWidget {
  const GridOverlayMapWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String imageString = ref.watch(selectedImageNotifier);

    if (imageString == '') {
      return const Loading();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: SizedBox(
                key: const ValueKey<String>('import-map-region'),
                width: constraints.maxWidth,
                child: const GridMapImporter(),
              ),
            ),
            SizedBox(
              // Two 48px calibration buttons plus the toolbar's 24px padding.
              height: constraints.maxHeight < 120 ? constraints.maxHeight : 120,
              child: SizedBox(
                key: const ValueKey<String>('import-controls-region'),
                width: constraints.maxWidth,
                child: const OverlayControlsRow(),
              ),
            ),
          ],
        );
      },
    );
  }
}
