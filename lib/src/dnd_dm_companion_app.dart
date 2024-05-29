import 'package:dnddmcompanion/screens/game_start_up/welcome_screen.dart';
import 'package:flutter/material.dart';

class DNDDMCompanionApp extends StatelessWidget {
  const DNDDMCompanionApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: const Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}
