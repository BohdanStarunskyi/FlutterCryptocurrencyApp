import 'package:flutter/material.dart';

class TagChip extends StatefulWidget {
  const TagChip({
    super.key,
    required this.name,
  });
  final String name;

  @override
  State<TagChip> createState() => _TagChipState();
}

class _TagChipState extends State<TagChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(widget.name),
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      shape: const StadiumBorder(side: BorderSide(color: Colors.green)),
      labelStyle: const TextStyle(color: Colors.green),
    );
  }
}
