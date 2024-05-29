import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/models/save_file.dart';
import 'package:dnddmcompanion/screens/game_start_up/save_file_selection_screen.dart';
import 'package:dnddmcompanion/screens/game_start_up/welcome_screen.dart';
import 'package:dnddmcompanion/services/data_services.dart';
import 'package:dnddmcompanion/widgets/characters/individual_character_card.dart';
import 'package:dnddmcompanion/widgets/inputs/breathing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllCharacterScreen extends ConsumerWidget {
  const AllCharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SaveFile saveFile = ref.watch(currentSaveFile)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Characters'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...saveFile.characters.map((character) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          //open character to edit
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: IndividualCharacterCard(
                                    character: character,
                                  ),
                                );
                              }).then((value) {
                            if (value != null) {
                              ref.read(currentSaveFile.notifier).state = ref
                                  .read(currentSaveFile.notifier)
                                  .state!
                                  .updateCharacter(value);

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
                                    "${character.firstName} ${character.lastName}"),
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
                text: 'Add Character',
                onPressed: () async {
                  //open pop with IndividualCharacterCard in it
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
                          .addCharacter(value);

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
