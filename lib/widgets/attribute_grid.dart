import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/round_text_field.dart';
import 'package:flutter/material.dart';

class AttributeGrid extends StatefulWidget {
  final Character character;

  const AttributeGrid({required this.character, Key? key}) : super(key: key);

  @override
  State<AttributeGrid> createState() => _AttributeGridState();
}

class _AttributeGridState extends State<AttributeGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      child: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        children: List.generate(
          6,
          (index) {
            return RoundTextField(
              dividerText: widget.character
                  .getAttributeList(widget.character)[index]
                  .name,
              controller: TextEditingController(
                text: widget.character
                    .getAttributeList(widget.character)[index]
                    .value
                    .toString(),
              ),
            );
          },
        ),
      ),
    );
  }
}
