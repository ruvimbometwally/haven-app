import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAY09NUNcL4zu1nM7xcytB3R-4_r8yvKKA",
            authDomain: "haven-ut6jze.firebaseapp.com",
            projectId: "haven-ut6jze",
            storageBucket: "haven-ut6jze.firebasestorage.app",
            messagingSenderId: "501428162267",
            appId: "1:501428162267:web:2ea197d88b582fff9d46fe"));
  } else {
    await Firebase.initializeApp();
  }
}
