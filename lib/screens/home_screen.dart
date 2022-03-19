import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/screens/character_detail.dart';
import 'package:dnddmcompanion/widgets/gradient_text_button.dart';
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
                    builder: (context) => CharacterDetail(
                      character: Character().defaultCharacter(),
                    ),
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
