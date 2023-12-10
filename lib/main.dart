import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyramids/onboarding.dart';
import 'package:pyramids/themes/dark.dart';
import 'package:pyramids/themes/themes.dart';
import 'logo.dart';
import 'nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<ValueNotifier<MyThemeMode>>(
      create: (_) => ValueNotifier<MyThemeMode>(MyThemeMode.light),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ValueNotifier<MyThemeMode>>(context).value;

    ThemeData selectedTheme;
    switch (themeMode) {
      case MyThemeMode.light:
        selectedTheme = lightTheme;
        break;
      case MyThemeMode.dark:
        selectedTheme = darkTheme;
        break;
      case MyThemeMode.third:
        selectedTheme = thirdTheme;
        break;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: selectedTheme,
      home: OnBoardingScreen(),
    );
  }
}
