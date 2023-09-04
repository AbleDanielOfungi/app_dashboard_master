import 'package:riverpod/riverpod.dart';

final authStateProvider = StateProvider<AuthState>((ref) {
  return const AuthState.unknown();
});

class AuthState {
  final bool isLoggedIn;

  const AuthState.unknown() : isLoggedIn = false;

  const AuthState.loggedIn() : isLoggedIn = true;

  const AuthState.loggedOut() : isLoggedIn = false;
}
