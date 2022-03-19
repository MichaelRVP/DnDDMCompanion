import 'package:flutter/material.dart';

class DraggableMap extends StatelessWidget {
  final String imageString;

  const DraggableMap({required this.imageString, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return SizedBox(
        width: constraints.maxWidth * .8,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
            color: Colors.white.withOpacity(.8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 0.5,
                maxScale: 3,
                child: Image.asset(
                  imageString,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }
}
