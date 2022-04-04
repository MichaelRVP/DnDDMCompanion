import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayControlBundle extends ConsumerWidget {
  final String hintText;

  const OverlayControlBundle({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  incrementer > 0 ? incrementer-- : null;
                });
              },
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  incrementer++;
                });
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        Text('$incrementer'),
        Text(widget.hintText),
      ],
    );
  }
}
