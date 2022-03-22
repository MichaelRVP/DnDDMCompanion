import 'package:dnddmcompanion/models/providers/selected_image_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => SelectedImageNotifier(),
    ),
  ], child: const MyApp()));
}
