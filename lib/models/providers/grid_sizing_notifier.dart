import 'package:dnddmcompanion/models/grid_sizing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as rp;

class GridSizingNotifier extends rp.StateNotifier<GridSizing> {
  GridSizingNotifier() : super(const GridSizing(wallMap: {}));

  // ignore: use_setters_to_change_properties
  void updateGrid(GridSizing gridSizing) {
    state = gridSizing;
  }
}

final gridSizingNotifierProvider =
    rp.StateNotifierProvider.autoDispose<GridSizingNotifier, GridSizing>(
  (ref) {
    return GridSizingNotifier();
  },
);
