import 'package:flutter/material.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';

class SurasListItem extends StatelessWidget {
  int index;

  SurasListItem({required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(AppRoutes.suraDetails1RouteName, arguments: index);
      },
      child: Row(
        spacing: width * .04,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/Group.png'),
              Text("${index + 1}", style: AppStyles.bold20white),
            ],
          ),
          Column(
            spacing: height * .01,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResourses.englishQuranSurahs[index],
                style: AppStyles.bold20white,
              ),
              Text(
                "${QuranResourses.AyatNumber[index]} Verses",
                style: AppStyles.bold16white,
              ),
            ],
          ),
          Spacer(),
          Text(
            QuranResourses.arabicAuranSuras[index],
            style: AppStyles.bold20white,
          ),
        ],
      ),
    );
  }
}
