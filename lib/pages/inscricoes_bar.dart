import 'package:flutter/material.dart';

class InscricoesBar extends StatelessWidget {
  const InscricoesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Inscrições',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
