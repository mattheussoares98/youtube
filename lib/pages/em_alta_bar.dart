import 'package:flutter/material.dart';

class EmAltaBar extends StatelessWidget {
  const EmAltaBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Em alta',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
