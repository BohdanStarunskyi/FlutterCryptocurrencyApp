import 'package:flutter/material.dart';

class TeamMemberItem extends StatefulWidget {
  const TeamMemberItem({
    super.key,
    required this.name,
  });
  final String name;
  @override
  State<TeamMemberItem> createState() => _TeamMemberItemState();
}

class _TeamMemberItemState extends State<TeamMemberItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
