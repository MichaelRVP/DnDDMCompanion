import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/models/save_file.dart';
import 'package:dnddmcompanion/screens/game_start_up/save_file_selection_screen.dart';
import 'package:dnddmcompanion/screens/game_start_up/welcome_screen.dart';
import 'package:dnddmcompanion/services/data_services.dart';
import 'package:dnddmcompanion/widgets/characters/individual_character_card.dart';
import 'package:dnddmcompanion/widgets/inputs/breathing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllEnemiesScreen extends ConsumerWidget {
  const AllEnemiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SaveFile saveFile = ref.watch(currentSaveFile)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Enemies'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...saveFile.enemies.map((enemy) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          //open enemy to edit
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: IndividualCharacterCard(
                                    character: enemy,
                                  ),
                                );
                              }).then((value) {
                            if (value != null) {
                              ref.read(currentSaveFile.notifier).state = ref
                                  .read(currentSaveFile.notifier)
                                  .state!
                                  .updateEnemy(value);

                              DataServices().saveSaveFile(
                                  ref.read(saveStructureProvider)!,
                                  ref.read(currentSaveFile)!);
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "${enemy.firstName} ${enemy.lastName}"),
                              ),
                            ],
                          ),
                        ),
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
                text: 'Add Enemy',
                onPressed: () async {
                  //open pop with IndividualEnemyCard in it
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: IndividualCharacterCard(
                            character: Character(),
                          ),
                        );
                      }).then((value) {
                    if (value != null) {
                      ref.read(currentSaveFile.notifier).state = ref
                          .read(currentSaveFile.notifier)
                          .state!
                          .addEnemy(value);

                      DataServices().saveSaveFile(
                          ref.read(saveStructureProvider)!,
                          ref.read(currentSaveFile)!);
                    }
                  });
                },
              ))
        ],
      ),
    );
  }
}
