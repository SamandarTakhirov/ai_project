import 'package:ai_project/firebase_options.dart';
import 'package:ai_project/src/common/constants/observer.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'src/common/widgets/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Gemini.init(
    apiKey: 'AIzaSyBanRLsTZmPPj7zszlc5bmz8jMGmkNYT_c',
    enableDebugging: true,
  );
  
  Bloc.observer = ObServer();

  runApp(const App());
}
