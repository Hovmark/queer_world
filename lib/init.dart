import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:queer_world/firebase_options.dart';

Future<void> tryFirebaseInit() async {
  try {
    await Firebase.initializeApp(
      name: "queer-world",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log("Error in firebaseInit: $e");
  } finally {
    // FlutterNativeSplash.remove();
  }
}
