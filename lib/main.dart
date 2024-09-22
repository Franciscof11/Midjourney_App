import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourney_app/firebase_options.dart';
import 'package:midjourney_app/modules/midjourney/presentation/cubit/image_ai_cubit.dart';
import 'package:midjourney_app/modules/midjourney/presentation/initial_page/initial_page.dart';

import 'modules/midjourney/data/open_ai_service.dart';

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
    final openAIService = OpenAIService();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ImageAiCubit(openAIService: openAIService),
        child: const InitialPage(),
      ),
    );
  }
}
