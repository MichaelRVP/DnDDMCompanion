import 'package:dnddmcompanion/widgets/maps/grid_map/grid_map_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WallSaveRow extends ConsumerWidget {
  const WallSaveRow({
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
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GridMapGame(),
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
