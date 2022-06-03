import 'package:dnddmcompanion/widgets/maps/wrapper/grid_overlay_game_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridMapGameScreen extends ConsumerWidget {
  const GridMapGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: const GridOverlayGameWrapper(),
    );
  }
}
