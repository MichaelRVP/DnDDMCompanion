import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as rp;

import 'src/app.dart';

void main() async {
  runApp(const rp.ProviderScope(child: MyApp()));
}

final selectedImageNotifier = rp.StateProvider((ref) => '');
