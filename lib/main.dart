import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const RafiqApp());
}

class RafiqApp extends StatelessWidget {
  const RafiqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'رفيق الطالب',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF223055),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
