import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/features/company_info/widgets/company_info_page.dart';
import '/features/footer/footer.dart';
import '/features/common/widgets/top_icons.dart';
import '../notifiers/menu_notifier.dart';
import 'custom_appbar.dart';
import 'menu_slider.dart';

class BaseWidget extends ConsumerWidget {
  const BaseWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isVisible = ref.watch(visibilityProvider);
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(context),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const TopIcons(),
                  child,
                  const CompanyInfoPage(),
                  const Footer(),
                ],
              ),
            ),
          ),
          isVisible ? SliderMenu() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
