import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_strings.dart';
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
  int currentThekr = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.sebhaTitle,
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
                      athkar[currentThekr],
                      style: AppStyles.bold32whiteElmessiri,
                    ),
                    Text('$counter', style: AppStyles.bold32whiteElmessiri),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    ratio += .04;
                    if (counter < 33) {
                      counter++;
                    } else {
                      counter = 0;
                      if (currentThekr < athkar.length - 1) {
                        currentThekr++;
                      } else {
                        currentThekr = 0;
                      }
                    }
                    setState(() {});
                  },
                  child: AnimatedRotation(
                    turns: ratio,
                    duration: Duration(milliseconds: 220),
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
