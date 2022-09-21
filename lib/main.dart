import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:result_app/views/screen/result/result_home.dart';
import 'package:result_app/views/util/color.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Result_home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Tajawal",
        scaffoldBackgroundColor: newgreen,
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(
            color: Colors.amberAccent,
          ),
          iconColor: Color.fromRGBO(158, 158, 158, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          filled: true,
          fillColor: whitegreen,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 15, 90, 81),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
