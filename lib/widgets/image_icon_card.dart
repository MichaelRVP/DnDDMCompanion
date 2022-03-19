import 'package:dnddmcompanion/models/character.dart';
import 'package:flutter/material.dart';

class ImageIconCard extends StatelessWidget {
  final String imageString;

  const ImageIconCard({required this.imageString, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(40.0),
          ),
          color: Colors.white.withOpacity(.8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(image: AssetImage(imageString)),
      ),
    );
  }
}
