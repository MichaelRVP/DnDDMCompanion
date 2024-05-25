import 'package:dnddmcompanion/models/grid_sizing.dart';

class MapData {
  final String name;
  final String imagePath;
  final String description;
  final GridSizing gridSizing;

  const MapData({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.gridSizing,
  });

  //to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imagePath': imagePath,
      'description': description,
      'gridSizing': gridSizing,
    };
  }

  //from json
  factory MapData.fromJson(Map<String, dynamic> json) {
    return MapData(
      name: json['name'],
      imagePath: json['imagePath'],
      description: json['description'],
      gridSizing: json['gridSizing'],
    );
  }

  MapData copyWith({
    String? name,
    String? imagePath,
    String? description,
    GridSizing? gridSizing,
  }) {
    return MapData(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      gridSizing: gridSizing ?? this.gridSizing,
    );
  }
}
