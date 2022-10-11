import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Logic logicObj = Provider.of<Logic>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          /* decoration: BoxDecoration(
            color: Colors.pink.shade50,
          ) ,*/
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
             SwitchListTile.adaptive(
            value: logicObj.playerMode,
            onChanged: (bool newVal) {
              logicObj.changeMode(newVal);
            },
            title: const Text(
              'Turn on/off two player mode',
              style: TextStyle(
                //color: MyTheme.red,
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
          ),
            Text(
              'It\'s ${logicObj.activePlayer} Turn'.toUpperCase(),
              style: const TextStyle(
                //color: MyTheme.red,
                color: Colors.white,
                fontSize: 52,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: GridView.count(
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.0,
              crossAxisCount: 3,
              children: List.generate(
                9,
                (index) => InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: (logicObj.gameOver == true || logicObj.turn == 9)
                      ? null
                      : () => logicObj.playGame(index),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          strokeAlign: StrokeAlign.center,
                          width: 2,
                        ),
                        // color: MyTheme.red,
                      ),
                      child: Center(
                        child: Text(
                          logicObj.playerX.contains(index)
                              ? logicObj.x
                              : logicObj.playerO.contains(index)
                                  ? logicObj.o
                                  : logicObj.empty,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 35),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Text(
              logicObj.result.toUpperCase(),
              style: const TextStyle(
                //color: MyTheme.red,
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                logicObj.repeatGame();
              },
              icon: const Icon(Icons.replay),
              label: const Text(
                'Repeat the game',
                style: TextStyle(
                  //color: MyTheme.red,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 50),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }


}
