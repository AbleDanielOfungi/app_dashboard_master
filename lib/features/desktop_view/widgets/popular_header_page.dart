import 'package:flutter/material.dart';

class PopularHeaders extends StatelessWidget {
  const PopularHeaders({
    super.key,
    required this.headerTitle,
    required this.headerLabel,
    this.fontSize = 20,
    this.color = Colors.green,
  });

  final String headerTitle;
  final String headerLabel;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            headerLabel,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
