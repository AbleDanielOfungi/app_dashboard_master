import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/focus_controller.dart';

class TopIcons extends ConsumerWidget {
  const TopIcons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusController = FocusController();
    return Stack(
      children: [
        Container(
          height: 130,
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo1.webp', width: 80, height: 80),
                    const Text(
                      'Here for you',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  focusController.openSliderMenu(ref: ref);
                  focusController.focusNode!.unfocus();
                },
                child: const Icon(
                  Icons.menu_sharp,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
