import 'package:flutter/material.dart';
import 'package:queer_world/design_components/queer_icons.dart';
import 'package:queer_world/design_components/queer_sizes.dart';

class BusinessRequestField extends StatelessWidget {
  const BusinessRequestField({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
  });

  final String label;
  final IconData icon;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QueerIcon(icon: icon),
        spacerWidth,
        Flexible(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(labelText: label),
          ),
        ),
      ],
    );
  }
}
