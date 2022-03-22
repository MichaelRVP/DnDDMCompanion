import 'dart:convert';

import 'package:flutter/services.dart';

class DataServices {
  Future<List<String>> getAllMaps() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('assets/images/maps/'))
        .where((String key) => key.contains('.png'))
        .toList();

    return imagePaths;
  }
}
