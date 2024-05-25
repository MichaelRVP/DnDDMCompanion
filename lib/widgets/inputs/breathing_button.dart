import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BreathingButton extends ConsumerStatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const BreathingButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _BreathingButtonState createState() => _BreathingButtonState();
}

class _BreathingButtonState extends ConsumerState<BreathingButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Tween<double> scaleTween = Tween<double>(begin: 1, end: 1.1);

    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: ScaleTransition(
        scale: scaleTween.animate(_controller),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(widget.text),
        ),
      ),
    );
  }
}
