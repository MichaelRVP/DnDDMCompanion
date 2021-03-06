import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/screens/full_map.dart';
import 'package:dnddmcompanion/screens/full_page_character_edit.dart';
import 'package:dnddmcompanion/screens/master_map_viewer.dart';
import 'package:dnddmcompanion/widgets/inputs/gradient_text_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 350,
              child: GradientTextButton(
                inputString: 'See Character',
                tapFunction: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FullPageCharacterEdit(
                      character: Character().defaultCharacter(),
                    ),
                  ));
                },
              ),
            ),
            SizedBox(
              width: 350,
              child: GradientTextButton(
                inputString: 'See Map',
                tapFunction: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FullMap(
                      imageString: 'images/maps/neverWinterMap.png',
                    ),
                  ));
                },
              ),
            ),
            SizedBox(
              width: 350,
              child: GradientTextButton(
                inputString: 'Master Map Viewer',
                tapFunction: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MasetMapViewer(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
