import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as rp;

import 'src/dnd_dm_companion_app.dart';

void main() async {
  runApp(
    const rp.ProviderScope(
      child: DNDDMCompanionApp(),
    ),
  );
}

final selectedImageNotifier = rp.StateProvider((ref) => '');
