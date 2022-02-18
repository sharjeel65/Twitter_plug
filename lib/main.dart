import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitter/dashboard/dashboardMain.dart';
import 'login.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(mainpage());
}

class mainpage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDw9gEydD7fH08ARm0Gx5-hz6FT0SZ61Lk",
          authDomain: "twitterplug-1ab14.firebaseapp.com",
          projectId: "twitterplug-1ab14",
          storageBucket: "twitterplug-1ab14.appspot.com",
          messagingSenderId: "811505263544",
          appId: "1:811505263544:web:3fed8e66249dc82c9aa54d",
          measurementId: "G-EEEL43TMGR"));


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('error');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return dashboard();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
