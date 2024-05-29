import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dnddmcompanion/models/save_file.dart';
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

  //function to add an image from comptuer to a character and in the assets/playericons folder
  Future<String> addCharacterImage() async {
    // Open the file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      withData: true, // Add this line
    );

    if (result != null) {
      // Get the file
      PlatformFile file = result.files.first;

      // Get the directory
      final directory = await getApplicationDocumentsDirectory();

      final directoryPath = '${directory.path}/DMCompanion/characterIcons';
      final dir = Directory(directoryPath);
      if (!await dir.exists()) {
        await dir.create(
            recursive:
                true); // Use recursive: true to create all directories in the path
      }

      // Create the file path
      final filePath =
          '${directory.path}/DMCompanion/characterIcons/${file.name}';

      // Copy the file to the directory
      final fileBytes = file.bytes;
      if (fileBytes != null) {
        // Check if fileBytes is not null
        final fileOnDevice = File(filePath);
        await fileOnDevice.writeAsBytes(fileBytes);

        return filePath;
      } else {
        throw Exception('Failed to read file bytes');
      }
    } else {
      return '';
    }
  }

  //save save file in save structure
  Future<void> saveSaveFile(
      SaveStructure saveStructure, SaveFile saveFile) async {
    // Update the save file in the save structure
    saveStructure = saveStructure.updateSaveFile(saveFile);

    // Save the save structure
    await saveSaveStructure(saveStructure);
  }
}
