import 'package:broker/auth/login_page.dart';
import 'package:broker/auth/register_page.dart';

import 'package:broker/home.dart';
import 'package:broker/pages/starting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  // UserService userService = UserService();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      // DevicePreview(builder: (context) =>
      const BrokerApp()
      // Wrap your app
      // ),
      );
}

class BrokerApp extends StatefulWidget {
  const BrokerApp({super.key});

  @override
  State<BrokerApp> createState() => _BrokerAppState();
}

class _BrokerAppState extends State<BrokerApp> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(' *** User is currently signed out! *** ');
      } else {
        print(' *** User is signed in! *** ');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      // key: ,

      supportedLocales: const [Locale("ar", "AE")],
      locale: const Locale("ar", "AE"),
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          // user is not login >> go to Starting Page then
          ? const HomePage()
          // user already
          : const StartingPage(),

      routes: {
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        StartingPage.id: (context) => const StartingPage(),
      },

      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}
