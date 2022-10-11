import 'package:flutter/material.dart';
import 'dart:math';

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null)
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Logic with ChangeNotifier {
  String x = 'X';
  String o = 'O';
  String empty = '';
  String activePlayer = 'X';
  bool playerMode = false;
  String result = '';
  bool gameOver = false;
  int turn = 0;

  List<int> playerX = [];
  List<int> playerO = [];

  void changeMode(bool newVal) {
    playerMode = newVal;
    notifyListeners();
  }

  void _updateActivePlayer(int index) {
    if (activePlayer == 'X') {
      playerX.add(index);
    } else {
      playerO.add(index);
    }
    turn++;
  }

  playGame(int index) {
    if ((playerX.isEmpty || !playerX.contains(index)) &&
        (playerO.isEmpty || !playerO.contains(index))) {
      _updateActivePlayer(index);
      activePlayer = (activePlayer == 'X') ? o : x;
      if (playerMode == false && !gameOver && turn != 9) {
        autoPlay(index);
        activePlayer = (activePlayer == 'X') ? o : x;
      }
    }
    checkWinner();
    if (turn == 9 || gameOver == true) {
      result = checkWinner();
    }

    notifyListeners();
  }

  String checkWinner() {
    if (playerX.containsAll(0, 1, 2) ||
        playerX.containsAll(3, 4, 5) ||
        playerX.containsAll(6, 7, 8) ||
        playerX.containsAll(0, 4, 8) ||
        playerX.containsAll(2, 4, 6) ||
        playerX.containsAll(0, 3, 6) ||
        playerX.containsAll(1, 4, 7) ||
        playerX.containsAll(2, 5, 8)) {
      gameOver = true;
      return 'X is the Winner';
    } else if (playerO.containsAll(0, 4, 8) ||
        playerO.containsAll(2, 4, 6) ||
        playerO.containsAll(0, 1, 2) ||
        playerO.containsAll(3, 4, 5) ||
        playerO.containsAll(6, 7, 8) ||
        playerO.containsAll(0, 3, 6) ||
        playerO.containsAll(1, 4, 7) ||
        playerO.containsAll(2, 5, 8)) {
      gameOver = true;
      return 'O is the Winner';
    } else {
      return 'It\'s Draw!';
    }
  }

  void repeatGame() {
    playerX = [];
    playerO = [];
    result = '';
    activePlayer = 'X';
    gameOver = false;
    turn = 0;
    notifyListeners();
  }

  Future<void> autoPlay(int index) async {
    List<int> playerComputer = [];
    for (var i = 0; i < 9; i++) {
      if (!playerX.contains(i) && !playerO.contains(i)) {
        playerComputer.add(i);
      }
    }
// start - center
    if (playerO.containsAll(0, 1) && playerComputer.contains(2))
      index = 2;
    else if (playerO.containsAll(3, 4) && playerComputer.contains(5))
      index = 5;
    else if (playerO.containsAll(6, 7) && playerComputer.contains(8))
      index = 8;
    else if (playerO.containsAll(0, 3) && playerComputer.contains(6))
      index = 6;
    else if (playerO.containsAll(1, 4) && playerComputer.contains(7))
      index = 7;
    else if (playerO.containsAll(2, 5) && playerComputer.contains(8))
      index = 8;
    else if (playerO.containsAll(0, 4) && playerComputer.contains(8))
      index = 8;
    else if (playerO.containsAll(2, 4) && playerComputer.contains(6))
      index = 6;

//center - end
    else if (playerO.containsAll(1, 2) && playerComputer.contains(0))
      index = 0;
    else if (playerO.containsAll(4, 5) && playerComputer.contains(3))
      index = 3;
    else if (playerO.containsAll(7, 8) && playerComputer.contains(6))
      index = 6;
    else if (playerO.containsAll(3, 6) && playerComputer.contains(0))
      index = 0;
    else if (playerO.containsAll(4, 7) && playerComputer.contains(1))
      index = 1;
    else if (playerO.containsAll(5, 8) && playerComputer.contains(2))
      index = 2;
    else if (playerO.containsAll(4, 8) && playerComputer.contains(0))
      index = 0;
    else if (playerO.containsAll(4, 6) && playerComputer.contains(2))
      index = 2;

    // start - end
    else if (playerO.containsAll(0, 2) && playerComputer.contains(1))
      index = 1;
    else if (playerO.containsAll(3, 5) && playerComputer.contains(4))
      index = 4;
    else if (playerO.containsAll(6, 8) && playerComputer.contains(7))
      index = 7;
    else if (playerO.containsAll(0, 6) && playerComputer.contains(3))
      index = 3;
    else if (playerO.containsAll(1, 7) && playerComputer.contains(4))
      index = 4;
    else if (playerO.containsAll(2, 8) && playerComputer.contains(5))
      index = 5;
    else if (playerO.containsAll(0, 8) && playerComputer.contains(4))
      index = 4;
    else if (playerO.containsAll(2, 6) && playerComputer.contains(4))
      index = 4;

//start-center

    else if (playerX.containsAll(0, 1) && playerComputer.contains(2))
      index = 2;
    else if (playerX.containsAll(3, 4) && playerComputer.contains(5))
      index = 5;
    else if (playerX.containsAll(6, 7) && playerComputer.contains(8))
      index = 8;
    else if (playerX.containsAll(0, 3) && playerComputer.contains(6))
      index = 6;
    else if (playerX.containsAll(1, 4) && playerComputer.contains(7))
      index = 7;
    else if (playerX.containsAll(2, 5) && playerComputer.contains(8))
      index = 8;
    else if (playerX.containsAll(0, 4) && playerComputer.contains(8))
      index = 8;
    else if (playerX.containsAll(2, 4) && playerComputer.contains(6))
      index = 6;

//center - end
    else if (playerX.containsAll(1, 2) && playerComputer.contains(0))
      index = 0;
    else if (playerX.containsAll(4, 5) && playerComputer.contains(4))
      index = 3;
    else if (playerX.containsAll(7, 8) && playerComputer.contains(6))
      index = 6;
    else if (playerX.containsAll(3, 6) && playerComputer.contains(0))
      index = 0;
    else if (playerX.containsAll(4, 7) && playerComputer.contains(1))
      index = 1;
    else if (playerX.containsAll(5, 8) && playerComputer.contains(2))
      index = 2;
    else if (playerX.containsAll(4, 8) && playerComputer.contains(0))
      index = 0;
    else if (playerX.containsAll(4, 6) && playerComputer.contains(2))
      index = 2;

    // start - end
    else if (playerX.containsAll(0, 2) && playerComputer.contains(1))
      index = 1;
    else if (playerX.containsAll(3, 5) && playerComputer.contains(4))
      index = 4;
    else if (playerX.containsAll(6, 8) && playerComputer.contains(7))
      index = 7;
    else if (playerX.containsAll(0, 6) && playerComputer.contains(3))
      index = 3;
    else if (playerX.containsAll(1, 7) && playerComputer.contains(4))
      index = 4;
    else if (playerX.containsAll(2, 8) && playerComputer.contains(5))
      index = 5;
    else if (playerX.containsAll(0, 8) && playerComputer.contains(4))
      index = 4;
    else if (playerX.containsAll(2, 6) && playerComputer.contains(4))
      index = 4;
    else if (playerComputer.contains(4))
      index = 4;
    else {
      Random random = Random();
      int randomIndex = random.nextInt(playerComputer.length);

      index = playerComputer[randomIndex];
    }

    _updateActivePlayer(index);
  }
}
