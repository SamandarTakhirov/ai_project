
import 'package:flutter/material.dart';

import '../../feature/splash_page/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "FloraAI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins"
      ),
      home: const SplashPage(),
    );
  }
}
