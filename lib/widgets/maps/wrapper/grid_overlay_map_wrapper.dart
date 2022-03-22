import 'package:dnddmcompanion/models/providers/selected_image_notifier.dart';
import 'package:dnddmcompanion/widgets/loading.dart';
import 'package:dnddmcompanion/widgets/maps/grid_map_overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridOverlayMapWrapper extends StatelessWidget {
  const GridOverlayMapWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imageString =
        Provider.of<SelectedImageNotifier>(context).imageString;

    return imageString != ''
        ? GridMapOverlay(
            imageString: imageString,
          )
        : const Loading();
  }
}
