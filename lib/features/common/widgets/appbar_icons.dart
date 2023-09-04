import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(right: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppBarIconTiles(iconData: FontAwesomeIcons.calendar),
          AppBarIconTiles(iconData: FontAwesomeIcons.envelope),
          AppBarIconTiles(iconData: FontAwesomeIcons.bell),
        ],
      ),
    );
  }
}

class AppBarIconTiles extends StatelessWidget {
  const AppBarIconTiles({super.key, required this.iconData});

  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 120,
      width: 70,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.only(right: 8, top: 16),
      decoration: const BoxDecoration(
        // color: Colors.grey,
        border: Border(
          right: BorderSide(
            color: Color(0Xffd2e1dc),
            // color: Colors.green,
          ),
        ),
      ),
      child: FaIcon(
        iconData,
        color: const Color(0Xff5eaa83),
      ),
    );
  }
}
