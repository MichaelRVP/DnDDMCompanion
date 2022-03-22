import 'package:flutter/material.dart';

class SmallImageIconCard extends StatelessWidget {
  final String imageString;

  const SmallImageIconCard({required this.imageString, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(imageString),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.white.withOpacity(.8)),
    );
  }
}
