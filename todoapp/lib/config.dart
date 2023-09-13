// Using flutter_dotenv package
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// https://github.com/ByneappLLC/flutter_config/blob/master/doc/ANDROID.md
// Android requires manually adding the following to your app's android/app/build.gradle
String googleApiKey = "";

Future<void> loadEnvVars() async {
  // await FlutterConfig.loadEnvVariables();
  await dotenv.load(
    fileName: ".env.prod",
  );
  // googleApiKey = await FlutterConfig.get('SECRET_API_KEY');
  googleApiKey = dotenv.get("SECRET_API_KEY", fallback: 'sane-default');
  log("ApiKey in config : $googleApiKey");
  if (googleApiKey == "sane-default" || googleApiKey.isEmpty) {
    log("ApiKey in config is null");
  }
}


// Or, using Dart Defines
// final String apiKey = String.fromEnvironment('API_KEY', defaultValue: 'default_value');
