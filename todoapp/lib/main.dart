import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app.dart';
import 'package:todoapp/config.dart' as config;
import 'firebase_options.dart';

void main() async {
  await config.loadEnvVars();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
