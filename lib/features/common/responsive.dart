import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  static bool isOnMobileView = true;
  static bool isOnTabletView = false;
  static bool isOnDesktopView = false;

  static bool restrictedToMobileView = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 650 || restrictedToMobileView) {
      isOnMobileView = true;
      isOnTabletView = isOnDesktopView = false;
    } else if (MediaQuery.of(context).size.width >= 1100) {
      isOnDesktopView = true;
      isOnMobileView = isOnTabletView = false;
    } else {
      isOnTabletView = true;
      isOnMobileView = isOnDesktopView = false;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (isOnMobileView) {
          return mobile;
        }
        if (isOnTabletView) {
          return tablet ?? desktop;
        }

        return desktop;
      },
    );
  }
}
