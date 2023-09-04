import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/focus_controller.dart';
import '../notifiers/menu_notifier.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget? CustomAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 70),
    child: AppBar(
      toolbarHeight: 70,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 9),
      title: SearchBar(),
    ),
  );
}

class SearchBar extends ConsumerWidget {
  SearchBar({super.key});

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final FocusController focusController = FocusController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isVisible = ref.watch(visibilityProvider);

    return Stack(
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Icon(
                  Icons.search_sharp,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  focusNode: focusNode,
                  onTap: () {
                    focusController.focusNode = focusNode;
                    focusController.context = context;
                    log('focusNode: ${focusController.focusNode}');
                    if (isVisible) focusController.closeSliderMenu(ref);
                  },
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hintText: 'search product by name',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 121, 135, 143)),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
