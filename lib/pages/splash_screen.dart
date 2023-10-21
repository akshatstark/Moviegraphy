import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({
    Key? key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cover',
      theme: ThemeData(primarySwatch: Colors.orange),

      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/logo.png')
              )
          ),
        ),
      ),
    );
  }
}
