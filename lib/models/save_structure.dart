import 'package:dnddmcompanion/models/save_file.dart';

class SaveStructure {
  final String path;
  final List<SaveFile> saveData;

  SaveStructure({
    required this.path,
    required this.saveData,
  });

  //copy with
  SaveStructure copyWith({
    String? path,
    List<SaveFile>? saveData,
  }) {
    return SaveStructure(
      path: path ?? this.path,
      saveData: saveData ?? this.saveData,
    );
  }

  //to json
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'saveData': saveData.map((saveFile) => saveFile.toJson()).toList(),
    };
  }

  //from json
  factory SaveStructure.fromJson(Map<String, dynamic> json) {
    return SaveStructure(
      path: json['path'],
      saveData: json['saveData'].map<SaveFile>((saveFile) => SaveFile.fromJson(saveFile)).toList(),
    );
  }

  //add new save file
  SaveStructure addSaveFile(SaveFile saveFile) {
    return SaveStructure(
      path: path,
      saveData: [...saveData, saveFile],
    );
  }

}
