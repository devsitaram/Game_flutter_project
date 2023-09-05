import 'dart:convert';

import 'package:http/http.dart' as http;

import 'game_model.dart';

class GameServices {
  static Future<dynamic> getGames() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.freetogame.com/api/games/'),
      );
      if (response.statusCode == 200) {
        var tempMap = {"sports": "1", 'data': response.body};
        print(tempMap);
        var newRespons = GameModel.fromJson(json.decode(tempMap.toString()));
        return newRespons;
      } else {
        print('API call is failed.');
      }
    } catch (e) {
      print('Exception');
      print(e);
    }
  }
}
