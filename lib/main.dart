import 'package:chatapp/Screens/auth_screen.dart';
import 'package:chatapp/Screens/chat_screen.dart';
import 'package:chatapp/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, appSnapshot) {
          return MaterialApp(
            title: 'Flutter Chat',
            theme: ThemeData(
              primarySwatch: Colors.pink,
              backgroundColor: Colors.pink,
              accentColor: Colors.deepPurple,
              accentColorBrightness: Brightness.dark,
              buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.pink,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            home: appSnapshot.connectionState != ConnectionState.done ? SplashScreen() : StreamBuilder(
              builder: (ctx, userSnapshot) {
                if (userSnapshot.hasData) {
                  return ChatScreen();
                }
                return AuthScreen();
              },
              stream: FirebaseAuth.instance.authStateChanges(),
            ),
          );
        });
  }
}
