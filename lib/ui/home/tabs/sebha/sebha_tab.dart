import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double ratio = 0;
  List<String> athkar = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
    'الله اكبر',
  ];
  int counter = 0;
  int currentTheker = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: AppStyles.bold32whiteElmessiri,
          textAlign: TextAlign.center,
        ),
        Column(
          children: [
            Image.asset(AppImages.sebhaHead),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      athkar[currentTheker],
                      style: AppStyles.bold32whiteElmessiri,
                    ),
                    Text('$counter', style: AppStyles.bold32whiteElmessiri),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    ratio += .05;
                    if (counter < 33) {
                      counter++;
                    } else {
                      counter = 0;
                      if (currentTheker < athkar.length - 1) {
                        currentTheker++;
                      } else {
                        currentTheker = 0;
                      }
                    }
                    setState(() {});
                  },
                  child: AnimatedRotation(
                    turns: ratio,
                    duration: Duration(milliseconds: 200),
                    child: Image.asset(AppImages.sebhaBody),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
