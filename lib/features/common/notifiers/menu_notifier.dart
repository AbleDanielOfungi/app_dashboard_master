import 'package:hooks_riverpod/hooks_riverpod.dart';

final visibilityProvider = StateNotifierProvider<VisibilityController, bool>(
  (ref) => VisibilityController(),
);

class VisibilityController extends StateNotifier<bool> {
  VisibilityController() : super(false);

  void toggleVisibility({required bool value}) {
    state = value;
  }
}
