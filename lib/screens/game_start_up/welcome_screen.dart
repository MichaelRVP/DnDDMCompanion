import 'package:dnddmcompanion/models/save_structure.dart';
import 'package:dnddmcompanion/screens/game_start_up/save_file_selection_screen.dart';
import 'package:dnddmcompanion/services/data_services.dart';
import 'package:dnddmcompanion/widgets/inputs/breathing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//save structure provider
final saveStructureProvider = StateProvider<SaveStructure?>((ref) {
  return null;
});

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated text
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Welcome to DnD Companion',
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
          ),

          // Breathing button
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BreathingButton(
                    text: 'New Save Structure',
                    onPressed: () async {
                      bool confirmed = false;

                      //popup asking user are they sure they want to start a new game, you can always add another save file
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Are you sure?'),
                            content: const Text(
                                'Starting a new game will erase all current data. Are you sure you want to continue?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  confirmed = true;
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      );

                      if (!confirmed) {
                        return;
                      }

                      SaveStructure saveStructure =
                          await DataServices().createSaveStructure();

                      ref.read(saveStructureProvider.notifier).state =
                          saveStructure;

                      //navigate to save file selection screen that is not named
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SaveFileSelectionScreen()),
                      );
                    }),
                BreathingButton(
                  text: 'Load Save Structure',
                  onPressed: () async {
                    SaveStructure? saveStructure =
                        await DataServices().loadSaveStructure();

                    //if null, snackbar saying no save file found
                    if (saveStructure == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No save file found.'),
                        ),
                      );
                      return;
                    }

                    ref.read(saveStructureProvider.notifier).state =
                        saveStructure;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SaveFileSelectionScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
