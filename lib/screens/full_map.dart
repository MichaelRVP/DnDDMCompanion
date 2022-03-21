import 'package:dnddmcompanion/widgets/draggable_map.dart';
import 'package:dnddmcompanion/widgets/small_character_row_list.dart';
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
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              child: Center(
                child: DraggableMap(imageString: widget.imageString),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width * .8,
              child: Center(
                child: SmallCharacterRowList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
