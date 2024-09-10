import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:midjourney_app/firebase_options.dart';
import 'package:midjourney_app/modules/midjourney/data/open_ai_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () async {
              final rep = OpenAIService();

              await rep.setupRemoteConfig();
            },
            child: const Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
