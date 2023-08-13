// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import '../screens/results.dart';

class Backend extends ChangeNotifier {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _username = "Player 1";
  String _userchoice = '';
  String _friendname = "Player 2";
  String _friendchoice = '';
  int _userScore = 0;
  int _friendScore = 0;

  String get username => _username;
  String get userchoice => _userchoice;
  String get friendname => _friendname;
  String get friendchoice => _friendchoice;
  int get userScore => _userScore;
  int get friendScore => _friendScore;

  void updateUsername(String newUsername, String newFriendname) {
    _username = newUsername;
    _friendname = newFriendname;
    notifyListeners();
  }

  void updateChoices(String newUserChoice, String newFriendChoice) {
    _userchoice = newUserChoice;
    _friendchoice = newFriendChoice;
    notifyListeners();
  }

  void updateScores(int newUserScore, int newFriendScore) {
    _userScore = newUserScore;
    _friendScore = newFriendScore;
    notifyListeners();
  }

  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));

  String currentPlayer = 'X';

  int winnerScore = 0;
  String winnerPlayer = '';

  void updateBoard(int index) async {
    int i = (index / 3).floor();
    int j = (index % 3);
    if (board[i][j] == '') {
      board[i][j] = currentPlayer;
      

      // check if the any player has won
      if (_checkForWin(i, j, currentPlayer)) {
        if (currentPlayer == userchoice) {
          _userScore += 1;
          winnerScore = userScore;
          winnerPlayer = username;
        } else {
          _friendScore += 1;
          winnerScore = friendScore;
          winnerPlayer = friendname;
        }

        clearBoard();
        Future.delayed(const Duration(seconds: 0), () {
          navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
              builder: (context) => ResultsPage(
                  playerName: winnerPlayer, playerScore: winnerScore)));
        });

        notifyListeners();
      } else {
        bool isBoardFull = true;
        for (int i = 0; i < board.length; i++) {
          for (int j = 0; j < board.length; j++) {
            if (board[i][j] == '') {
              isBoardFull = false;
              break;
            }
          }
        }
        if (isBoardFull) {
          clearBoard();
          notifyListeners();
          await Future.delayed(const Duration(seconds: 1));
        }
      }

      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      notifyListeners();
    }
  }

  /// The function "clearBoard" generates a new 3x3 board filled with empty strings and notifies
  /// listeners.
  void clearBoard() {
    board = List.generate(3, (_) => List.filled(3, ''));
    notifyListeners();
  }

  bool _checkForWin(int row, int col, String cureentPlayer) {
    if (_checkRow(row, currentPlayer) ||
        _checkCol(col, currentPlayer) ||
        _checkDiagonal(row, col, currentPlayer)) {
      return true;
    }

    return false;
  }

  //check for row
  bool _checkRow(int row, String currentPlayer) {
    for (int i = 0; i < board.length; i++) {
      if (board[row][i] != currentPlayer) {
        return false;
      }
    }
    return true;
  }

  //check for column
  bool _checkCol(int col, String currentPlayer) {
    for (int i = 0; i < board.length; i++) {
      if (board[i][col] != currentPlayer) {
        return false;
      }
    }
    return true;
  }

  //check for diagonal
  bool _checkDiagonal(int row, int col, String currentPlayer) {
    bool diagonal1 = true;
    bool diagonal2 = true;

    for (int i = 0; i < board.length; i++) {
      if (board[i][i] != currentPlayer) {
        diagonal1 = false;
      }
      if (board[i][board.length - 1 - i] != currentPlayer) {
        diagonal2 = false;
      }
    }

    //check if any of the diagonal is zero

    return diagonal1 || diagonal2;
  }
}
