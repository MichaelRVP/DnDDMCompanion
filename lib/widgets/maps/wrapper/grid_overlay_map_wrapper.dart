import 'package:dnddmcompanion/main.dart';
import 'package:dnddmcompanion/widgets/loading.dart';
import 'package:dnddmcompanion/widgets/maps/grid_map_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridOverlayMapWrapper extends ConsumerWidget {
  const GridOverlayMapWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String imageString = ref.watch(selectedImageNotifier);

    return imageString != ''
        ? GridMapOverlay(
            imageString: imageString,
          )
        : const Loading();
  }
}
