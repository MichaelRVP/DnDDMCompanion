import 'package:dnddmcompanion/models/save_file.dart';
import 'package:dnddmcompanion/screens/game_start_up/save_file_selection_screen.dart';
import 'package:dnddmcompanion/widgets/inputs/breathing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllMapsScreen extends ConsumerWidget {
  const AllMapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SaveFile saveFile = ref.watch(currentSaveFile)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Maps'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...saveFile.maps.map((map) {
                  return InkWell(
                    onTap: () {
                      //open map to edit
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Text("${map.name} | ${map.description}"),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: BreathingButton(
                text: 'Add Map',
                onPressed: () {
                  //open map to add
                },
              ))
        ],
      ),
    );
  }
}
