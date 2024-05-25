import 'package:dnddmcompanion/models/save_file.dart';
import 'package:dnddmcompanion/models/save_structure.dart';
import 'package:dnddmcompanion/screens/game_start_up/welcome_screen.dart';
import 'package:dnddmcompanion/screens/home_screen.dart';
import 'package:dnddmcompanion/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentSaveFile = StateProvider<SaveFile?>((ref) {
  return null;
});

class SaveFileSelectionScreen extends ConsumerStatefulWidget {
  const SaveFileSelectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SaveFileSelectionScreenState();
}

class _SaveFileSelectionScreenState
    extends ConsumerState<SaveFileSelectionScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final saveStructure = ref.watch(saveStructureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Save File'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: saveStructure?.saveData.length ?? 0,
              itemBuilder: (context, index) {
                //show save file name and number of characters
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(saveStructure!.saveData[index].name),
                        subtitle: Text(
                            'Characters: ${saveStructure.saveData[index].characters.length}'),
                        onTap: () {
                          ref.read(currentSaveFile.notifier).state =
                              saveStructure.saveData[index];

                          //navigate to home screen with save file data
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeGameScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Enter the name of the new save file'),
                      content: TextField(
                        controller: _controller,
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () async {
                            ref.read(saveStructureProvider.notifier).state =
                                ref.read(saveStructureProvider)!.addSaveFile(
                                      SaveFile(
                                        name: _controller.text,
                                        characters: [],
                                        enemies: [],
                                        maps: [],
                                      ),
                                    );

                            ref.read(saveStructureProvider.notifier).state =
                                await DataServices().saveSaveStructure(ref
                                    .read(saveStructureProvider.notifier)
                                    .state!);

                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
