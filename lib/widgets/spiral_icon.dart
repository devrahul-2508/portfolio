import 'package:flutter/material.dart';

class SpiralIcon extends StatelessWidget {
  const SpiralIcon({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration:
          const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: child,
      ),
    );
  }
}
