import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final Color _bgColor;

  const TextSection(this._bgColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
      ),
      child: const Text(""),
    );
  }
}
