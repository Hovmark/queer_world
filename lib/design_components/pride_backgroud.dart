import 'package:flutter/material.dart';
import 'package:queer_world/design_components/colors.dart';

class PrideBackground extends StatefulWidget {
  const PrideBackground({super.key});

  @override
  State<PrideBackground> createState() => _PrideBackgroundState();
}

class _PrideBackgroundState extends State<PrideBackground> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - 50;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            decoration: const BoxDecoration(gradient: rainbowGradient),
          ),
        ],
      ),
    );
  }
}
