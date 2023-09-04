import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/app.dart';
import '/features/authentication/providers/auth_provider.dart';
import '/features/common/controller/utility_method.dart';
import 'features/desktop_view/widgets/product upload/add_prodct_screen.dart';
import 'firebase_options.dart';

FirebaseAnalytics? analytics;
FirebaseAnalyticsObserver? observer;

late final FirebaseApp app;
late final FirebaseAuth? auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  analytics = FirebaseAnalytics.instance;
  observer = FirebaseAnalyticsObserver(analytics: analytics!);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var isLoggedIn = ref.watch(authStateProvider).isLoggedIn;
    // log('isLoggedIn $isLoggedIn');
    // log('uid: ${userCredential?.user?.uid}');
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Cabin',
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal),
          bodyLarge: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
        ),
        primaryColor: const Color.fromRGBO(
            24, 95, 45, 1), // Set the color as primary color
        colorScheme: ColorScheme.fromSeed(
          background: const Color.fromRGBO(0, 0, 0, 0.5),
          seedColor: const Color.fromARGB(99, 3, 39, 14),
          // outline: Color.fromARGB(255, 35, 57, 75),
          outline: const Color.fromARGB(255, 36, 46, 65),
        ),
        useMaterial3: true,
      ),
      home:
          // isLoggedIn ? App(uid: userCredential!.user!.uid) : const LoginPage(),
      //AddProductScreen(),
          App(),
    );
  }
}
