import 'package:flutter/material.dart';

class QueerTextHeader extends StatelessWidget {
  const QueerTextHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge);
  }
}

class QueerTextBody extends StatelessWidget {
  const QueerTextBody({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }
}

class QueerTextBodySmall extends StatelessWidget {
  const QueerTextBodySmall({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodySmall);
  }
}

class QueerText extends StatelessWidget {
  const QueerText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
