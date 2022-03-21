import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart' as vector;

class DraggableMap extends StatefulWidget {
  final String imageString;

  const DraggableMap({required this.imageString, Key? key}) : super(key: key);

  @override
  State<DraggableMap> createState() => _DraggableMapState();
}

class _DraggableMapState extends State<DraggableMap> {
  late double rotation;

  @override
  void initState() {
    super.initState();

    rotation = 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Stack(
        children: [
          SizedBox(
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
                    minScale: 0.25,
                    maxScale: 8,
                    child: Transform.rotate(
                      angle: radians(rotation),
                      child: Image.asset(
                        widget.imageString,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black.withOpacity(.8),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    rotation > 260 ? rotation = 0 : rotation += 90;
                  });
                },
                icon: const Icon(Icons.rotate_left),
              ),
            ),
          ),
        ],
      );
    }));
  }
}

double radians(double degrees) => degrees * vector.degrees2Radians;
