import 'package:dnddmcompanion/screens/game_start_up/save_file_selection_screen.dart';
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
                    onTap: () {},
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
                    onTap: () {},
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
                    onTap: () {},
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
