import 'package:flutter/material.dart';
import 'package:game/features/gamepage/game_services.dart';

import 'game_model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<GameModel>? games;
  // to hold the retrieved game data
  Future apicall() async {
    var listOfGame = await GameServices.getGames();
    setState(
      () {
        games = listOfGame;
      },
    );
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Home Page'),
          // Text(games![0].id.toString()),
        ],
      ),
    );
  }
}
