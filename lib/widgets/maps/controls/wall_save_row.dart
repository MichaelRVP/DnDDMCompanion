import 'package:dnddmcompanion/screens/grid_map_game_screen.dart';
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
