import 'package:flutter/cupertino.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_item_card.dart';
import 'package:islami_app/utils/size_utils.dart';

class RecitersList extends StatelessWidget {
  List<String> reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
    'Abdullah Bsfar',
    'Yasir al-Dawsari',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return RadioItemCard(name: reciters[index]);
      },
      itemCount: reciters.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: SizeConfig.height(context) * .02);
      },
    );
  }
}
