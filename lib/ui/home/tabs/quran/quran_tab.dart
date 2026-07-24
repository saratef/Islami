import 'package:flutter/material.dart';
import 'package:islami_app/cash/shared_prefrence_utils.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/most_recent_item.dart';
import 'package:islami_app/ui/home/tabs/quran/suras_list_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_strings.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/app_routes.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: SingleChildScrollView(

        child: Column(
          spacing: height * .01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (text) {
                searchBySuraName(text);
              },
              style: AppStyles.bold16white,
              cursorColor: AppColors.primaryColor,

              decoration: InputDecoration(
                prefixIcon: ImageIcon(
                  AssetImage(AppIcons.quranIcon),
                  color: AppColors.primaryColor,
                ),

                enabledBorder: builtOutlineInputBorder(),
                focusedBorder: builtOutlineInputBorder(),
                hintText: AppStrings.suraName,
                hintStyle: AppStyles.bold16white,
              ),
            ),
            MostRecentItem(),


            Text(AppStrings.surasList, style: AppStyles.bold16white),
            filterList.isEmpty ?
            Center(
              child: Text(
                'No Sura Name Found', style: AppStyles.bold20primary,),
            ) : ListView.separated(

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    saveLastSuraIndex(filterList[index]);
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetails1RouteName,
                      arguments: filterList[index],
                    );
                  },

                  child: SurasListItem(index: filterList[index]),
                );
              },

              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  endIndent: width * .06,
                  height: height * .03,
                  indent: width * .06,
                  color: AppColors.whiteColor,
                  thickness: 2,
                );
              },
              itemCount: filterList.length,
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder builtOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }

  void searchBySuraName(String suraName) {
    List<int> searchList = [];
    for (int i = 0; i < QuranResourses.englishQuranSurahs.length; i++) {
      if (QuranResourses.englishQuranSurahs[i].toLowerCase().contains(
          suraName.toLowerCase())) {
        searchList.add(i);
      }
    }
    for (int i = 0; i < QuranResourses.arabicQuranSuras.length; i++) {
      if (QuranResourses.arabicQuranSuras[i].toLowerCase().contains(
          suraName.toLowerCase())) {
        searchList.add(i);
      }
    }
    filterList = searchList;
    setState(() {

    });
  }
}
