import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/suras_list_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_strings.dart';
import 'package:islami_app/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        spacing: height * .01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
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
          Text(AppStrings.mostRecent, style: AppStyles.bold16white),
          SizedBox(
            height: height * .2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                          Text('Al-Anbyia', style: AppStyles.bold24black),
                          Text('الانبياء', style: AppStyles.bold24black),
                          Text('112 اية', style: AppStyles.bold14black),
                        ],
                      ),
                      Image.asset(AppImages.mostRecent),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: width * .04);
              },
              itemCount: 10,
            ),
          ),
          Text(AppStrings.surasList, style: AppStyles.bold16white),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return SurasListItem(index: index);
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
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder builtOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
