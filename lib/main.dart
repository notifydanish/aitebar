import 'package:etibaar/core/sl/service_locator.dart';
import 'package:etibaar/etibaar_app.dart';
import 'package:etibaar/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// dependency injection
  configureDependencies();

  runApp(EtibaarApp());
}
