import 'package:dnddmcompanion/widgets/draggable_map.dart';
import 'package:flutter/material.dart';

class FullMap extends StatefulWidget {
  final String imageString;

  const FullMap({required this.imageString, Key? key}) : super(key: key);

  @override
  State<FullMap> createState() => _FullMapState();
}

class _FullMapState extends State<FullMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: DraggableMap(imageString: widget.imageString),
            ),
          ],
        ),
      ),
    );
  }
}
