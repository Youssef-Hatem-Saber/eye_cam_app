import 'package:flutter/material.dart';

class TextBetweenLines extends StatelessWidget {
  final String text;

  const TextBetweenLines({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        const Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}