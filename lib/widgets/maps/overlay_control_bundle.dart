import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayControlBundle extends ConsumerStatefulWidget {
  final double incrementer;
  final String hintText;

  const OverlayControlBundle({
    Key? key,
    required this.incrementer,
    required this.hintText,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OverlayControlBundleState();
}

class _OverlayControlBundleState extends ConsumerState<OverlayControlBundle> {
  late int incrementer;

  @override
  void initState() {
    super.initState();

    incrementer = widget.incrementer;
  }

  @override
  Widget build(BuildContext context) {
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
