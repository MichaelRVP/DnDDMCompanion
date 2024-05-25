import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dnddmcompanion/models/save_structure.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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

  // Function to make a new save structure
  Future<SaveStructure> createSaveStructure() async {
    SaveStructure saveStructure = SaveStructure(path: '', saveData: []);

    final saveFileJson = saveStructure.toJson();

    // Get the directory to save the file
    final directory = await getApplicationDocumentsDirectory();

    // Create a new directory named DMCompanion if it doesn't exist
    final dmCompanionDirectory = Directory('${directory.path}/DMCompanion');
    if (!await dmCompanionDirectory.exists()) {
      await dmCompanionDirectory.create();
    }

    // Create the file path
    final filePath = '${dmCompanionDirectory.path}/DMCompanion.json';

    // Save the JSON to the file
    final file = File(filePath);
    await file.writeAsString(json.encode(saveFileJson));

    // Update the path in the saveStructure and return it
    saveStructure = saveStructure.copyWith(path: filePath);
    return saveStructure;
  }

  Future<SaveStructure?> loadSaveStructure() async {
    // Get the directory
    final directory = await getApplicationDocumentsDirectory();

    // Create the file path
    final filePath = '${directory.path}/DMCompanion/DMCompanion.json';

    final file = File(filePath);

    if (await file.exists()) {
      // Read the JSON data from the file
      String jsonData = await file.readAsString();

      // Convert the JSON data to a SaveStructure and return it
      SaveStructure saveStructure =
          SaveStructure.fromJson(json.decode(jsonData))
              .copyWith(path: filePath);
      return saveStructure;
    } else {
      // File does not exist
      return null;
    }
  }

  Future<SaveStructure> saveSaveStructure(SaveStructure saveStructure) async {
    // Convert the SaveStructure to JSON
    String jsonData = json.encode(saveStructure.toJson());

    // Write the JSON data to the file at the specified path
    final file = File(saveStructure.path);
    await file.writeAsString(jsonData);

    return saveStructure;
  }
}
