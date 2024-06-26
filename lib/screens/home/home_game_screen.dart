import 'package:dnddmcompanion/screens/characters/all_character_screen.dart';
import 'package:dnddmcompanion/screens/enemies/all_enemies_screen.dart';
import 'package:dnddmcompanion/screens/game_start_up/save_file_selection_screen.dart';
import 'package:dnddmcompanion/screens/maps/all_maps_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeGameScreen extends ConsumerWidget {
  const HomeGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: const Text(
                      'Characters',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AllCharacterScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: const Text(
                      'Enemies',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      //open enemies
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AllEnemiesScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: const Text(
                      'Maps',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      //open maps
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AllMapsScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: const Text(
                      'Play Session',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: const Text(
                      'Choose Different Save File',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      ref.read(currentSaveFile.notifier).state = null;
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
