import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});
  final List<FaIcon> icons = const [
    FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
    FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
    FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
    FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
    FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
  ];

  void iconPressed({int? index}) {
    log('Index: $index');
    if (index == 0) {
      // navigate to linkedin profile
    } else if (index == 1) {
      // navigate to twitter profile
    } else if (index == 2) {
      // navigate to whatsapp profile
    } else if (index == 3) {
      // navigate to facebook profile
    } else {
      // navigate to instagram profile
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          icons.length,
          (index) => Transform.translate(
            offset: const Offset(-9, 0),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: icons[index],
              onPressed: () {
                iconPressed(index: index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
