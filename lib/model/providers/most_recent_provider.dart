import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? mostRecentListAsString =
        prefs.getStringList('most_recent') ?? [];
    mostRecentList = mostRecentListAsString
        .map((element) => int.parse(element))
        .toList();

    // return mostRecentListAsInt;
    notifyListeners();
  }
}
