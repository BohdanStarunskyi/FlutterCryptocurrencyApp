import 'package:flutter/material.dart';

class CoinItem extends StatefulWidget {
  const CoinItem(
      {super.key,
      required this.rank,
      required this.name,
      required this.icon,
      required this.isActive});
  final String rank;
  final String name;
  final String icon;
  final bool isActive;
  @override
  State<CoinItem> createState() => _CoinItemState();
}

class _CoinItemState extends State<CoinItem> {
  @override
  Widget build(BuildContext context) {
    var stateTextColor = Colors.red;
    var stateText = "inactive";
    if (widget.isActive) {
      stateTextColor = Colors.green;
      stateText = "active";
    }
    var title = "${widget.rank} ${widget.name} ${widget.icon}";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 24.0),
        ),
        Text(stateText, style: TextStyle(color: stateTextColor, fontSize: 24.0))
      ],
    );
  }
}
