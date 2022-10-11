import 'package:flutter/material.dart';
import 'package:tic_tac_task/models/theme.dart';
import 'package:tic_tac_task/views/screen/home_page.dart';
import '../widgets/buttonStyle.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.1, 0.65],
        colors: [
          MyTheme.orange,
          MyTheme.red,
        ],
      )),
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tic Tac",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 65,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DancingScript'),
                ),
                SizedBox(
                  height: 270,
                  child: Image.asset(
                    'assets/images/2.png',
                  ),
                ),
              ]),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonInStart(
                onTappedButton: () {
                  Navigator.of(context).pushNamed(HomePage.home);
                },
                title: 'single player'),
            const SizedBox(height: 30),
            ButtonInStart(
                onTappedButton: () {
                  Navigator.of(context).pushNamed(HomePage.home);
                },
                title: 'with a friend'),
          ],
        ),
      ]),
    )));
  }
}
