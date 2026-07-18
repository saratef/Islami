import 'package:flutter/material.dart';
import 'package:islami_app/model/providers/most_recent_provider.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styles.dart';

class MostRecentItem extends StatefulWidget {
  MostRecentItem({super.key});

  @override
  State<MostRecentItem> createState() => _MostRecentItemState();
}

class _MostRecentItemState extends State<MostRecentItem> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      mostRecentProvider.getMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.mostRecent, style: AppStyles.bold16white),
          SizedBox(
            height: height * .2,
            child: ListView.separated(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetails1RouteName,
                      arguments: mostRecentProvider.mostRecentList[index],
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * .03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              QuranResourses
                                  .englishQuranSurahs[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24black,
                            ),
                            Text(
                              QuranResourses.arabicQuranSuras[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24black,
                            ),
                            Text(
                              '${QuranResourses.AyatNumber[mostRecentProvider.mostRecentList[index]]} Verses',
                              style: AppStyles.bold14black,
                            ),
                          ],
                        ),
                        Image.asset(AppImages.mostRecent),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: width * .04);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
