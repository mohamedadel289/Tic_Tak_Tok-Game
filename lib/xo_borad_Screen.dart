import 'package:flutter/material.dart';
import 'package:tictaktok/board_item.dart';

class XoBoradScreen extends StatefulWidget {
  static const String routeName = '/xo_borad_screen';

  const XoBoradScreen({super.key});

  @override
  State<XoBoradScreen> createState() => _XoBoradScreenState();
}

class _XoBoradScreenState extends State<XoBoradScreen> {
  List<String> board = List.filled(9, '');
  late String player1Symbol;
  late String player2Symbol;
  int player1Score = 0;
  int player2Score = 0;
  int round = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    player1Symbol = ModalRoute.of(context)!.settings.arguments as String;
    player2Symbol = player1Symbol == 'x' ? 'o' : 'x';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: .spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${player1Symbol.toUpperCase()}: $player1Score',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${player2Symbol.toUpperCase()}: $player2Score',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${round.isOdd ? player1Symbol.toUpperCase() : player2Symbol.toUpperCase()}\'s Turn',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: MediaQuery.sizeOf(context).height * 0.25,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                    itemCount: 9,
                    itemBuilder: (_, index) => BoardItem(
                      value: board[index],
                      onTap: (itemIndex) => onItemClicled(itemIndex),
                      index: index,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onItemClicled(int index) {
    if (board[index].isNotEmpty) return;
    if (round.isOdd) {
      board[index] = player1Symbol;
      if (checkWinner(player1Symbol)) {
        player1Score++;
        clearboard();
        return;
      }
    } else {
      board[index] = player2Symbol;
      if (checkWinner(player2Symbol)) {
        player2Score++;
        clearboard();
        return;
      }
    }
    if (round == 9) {
      clearboard();
      return;
    }
    round++;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if (round < 5) return false;
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }

    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i <= 2; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    return false;
  }

  void clearboard() {
    board = List.filled(9, '');
    round = 1;
    setState(() {});
  }
}
