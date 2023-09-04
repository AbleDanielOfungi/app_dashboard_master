import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifiers/menu_notifier.dart';

class FocusController {
  bool isKeyboardVisible = false;
  bool isMenuVisible = false;
  FocusNode? focusNode = FocusNode();

  BuildContext? context;
  WidgetRef? ref;

  void closeSliderMenu(ref) {
    ref.watch(visibilityProvider.notifier).toggleVisibility(value: false);
  }

  void openSliderMenu({WidgetRef? ref}) {
    log('FocusNode: $focusNode');
    // if (focusNode != null) {
    //   dismissKeyboard(context: context);
    // }

    ref!.watch(visibilityProvider.notifier).toggleVisibility(value: true);
  }

  void dismissKeyboard({BuildContext? context}) {
    // focusNode?.unfocus();
    FocusScope.of(context!).unfocus();
  }
}
