import 'package:flutter/material.dart';

class BigImageIconCard extends StatelessWidget {
  final String imageString;

  const BigImageIconCard({required this.imageString, Key? key})
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
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(40.0),
          ),
          color: Colors.white.withOpacity(.8)),
    );
  }
}
