import 'package:flutter/material.dart';

class DevelopmentalStage extends StatefulWidget {
  const DevelopmentalStage({super.key});

  @override
  State<DevelopmentalStage> createState() => _DevelopmentalStageState();
}

class _DevelopmentalStageState extends State<DevelopmentalStage> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Şu anda gelişitirme aşamasında',
          style: TextStyle(
            fontSize: 32,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
