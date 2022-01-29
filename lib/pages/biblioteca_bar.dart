import 'package:flutter/material.dart';

class BibliotecaBar extends StatelessWidget {
  const BibliotecaBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Biblioteca',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
