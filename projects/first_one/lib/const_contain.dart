import 'package:flutter/material.dart';
import 'package:first_one/roller.dart';

class GraidCont extends StatelessWidget {
  final String image;

  const GraidCont(this.color, {this.image = '', super.key});
  final List<Color> color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
