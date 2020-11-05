import 'package:chat_app_flutter/screens/auth_screen.dart';
import 'package:chat_app_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, appSnapshot) {
          return MaterialApp(
            title: 'Flutter Chat',
            theme: ThemeData(
                buttonTheme: ButtonTheme.of(context).copyWith(
                    buttonColor: Colors.cyan[50],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            home: AuthScreen(),
          );
        });
  }
}
