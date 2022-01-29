import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Início',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
