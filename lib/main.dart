import 'package:flutter/material.dart';
import 'package:moviegraphy/pages/main_page.dart';
import './pages/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  runApp(
      SplashPage(key: UniqueKey(), onInitializationComplete: () => runApp(
        ProviderScope(child: MyApp()),
      ))
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cover',
      initialRoute: 'home', debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => MainPage(),
      },
      theme: ThemeData(primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity)
    );
  }
}

