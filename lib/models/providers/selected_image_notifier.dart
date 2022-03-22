import 'package:flutter/material.dart';

class SelectedImageNotifier extends ChangeNotifier {
  String imageString;

  SelectedImageNotifier({this.imageString = ''});

  void setImage(String input) {
    imageString = input;
    notifyListeners();
  }
}
