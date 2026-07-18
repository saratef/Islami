import 'package:shared_preferences/shared_preferences.dart';

///save/write
void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList = prefs.getStringList('most_recent') ?? [];
  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  } else {
    mostRecentList.insert(0, '$newSuraIndex');
  }
  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }
  prefs.setStringList("most_recent", mostRecentList);
}

///read/get data
