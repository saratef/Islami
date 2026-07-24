import 'package:flutter/cupertino.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_item_card.dart';
import 'package:islami_app/utils/size_utils.dart';

class RadioList extends StatelessWidget {
  List<String> channels = [
    'Quran Kareem Radio 1',
    'Quran Kareem Radio 2',
    'Quran Kareem Radio 3',
    'Quran Kareem Radio 4',
    'Quran Kareem Radio 5',
    'Quran Kareem Radio 6',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return RadioItemCard(name: channels[index]);
      },
      itemCount: channels.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: SizeConfig.height(context) * .02);
      },
    );
  }
}
