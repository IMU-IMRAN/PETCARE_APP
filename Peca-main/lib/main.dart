import 'package:peca/components/checking.dart';
import 'package:peca/routes.dart';
import 'package:peca/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyBivKfoOnd6vogaHWa59k5N54dHgNk0sQ0",
      authDomain: "peca-62735.firebaseapp.com",
      projectId: "peca-62735",
      storageBucket: "peca-62735.appspot.com",
      messagingSenderId: "982734544814",
      appId: "1:982734544814:android:d593ee6f3e16d41502323f",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peca',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: Checking.routeName,
      routes: routes,
    );
  }
}
