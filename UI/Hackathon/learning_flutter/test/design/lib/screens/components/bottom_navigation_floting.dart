import 'package:flutter/material.dart';

class FlotingBottomNavigation extends StatelessWidget {
  const FlotingBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      elevation: 12,
      mini: true,
      child: const Icon(
        Icons.camera_alt_rounded,
      ),
    );
  }
}
