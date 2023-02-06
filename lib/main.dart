import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/firebase_options.dart';
import 'package:firebaseapp/products/show_products_view.dart';
import 'package:firebaseapp/views/homepage.dart';
import 'package:firebaseapp/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
