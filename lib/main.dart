import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/screen/home.dart';
import 'views/screen/logic.dart';
import 'views/screen/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Logic>(
      create: (context) => Logic(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF00061a),
          shadowColor: const Color(0xFF001456),
          splashColor: const Color(0xFF4169e8),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        //home: const StartScreen(),
      ),
    );
  }
}
