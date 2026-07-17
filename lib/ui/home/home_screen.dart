import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/home/tabs/time/time_tab.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_strings.dart';
import 'package:islami_app/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> bgImages = [
    AppImages.suraBg,
    AppImages.hadethBg,
    AppImages.sebhaBg,
    AppImages.radioBg,
    AppImages.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          bgImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/globalHeader.png',
                  height: MediaQuery.of(context).size.height * .17,
                  width: double.infinity,
                ),
                Expanded(child: tabs[selectedIndex]),
              ],
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              selectedItemColor: AppColors.whiteColor,
              unselectedItemColor: AppColors.blackColor,
              currentIndex: selectedIndex,
              selectedLabelStyle: AppStyles.bold12white,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              // backgroundColor: AppColors.primaryColor,
              items: [
                bottomNavigationBarItem(
                  icon: AppIcons.quranIcon,
                  label: AppStrings.quran,
                  index: 0,
                ),
                bottomNavigationBarItem(
                  icon: AppIcons.hadethIcon,
                  label: AppStrings.hadeth,
                  index: 1,
                ),
                bottomNavigationBarItem(
                  icon: AppIcons.sebhaIcon,
                  label: AppStrings.sebha,
                  index: 2,
                ),
                bottomNavigationBarItem(
                  icon: AppIcons.radioIcon,
                  label: AppStrings.radio,
                  index: 3,
                ),
                bottomNavigationBarItem(
                  icon: AppIcons.timeIcon,
                  label: AppStrings.time,
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),

              decoration: BoxDecoration(
                color: AppColors.blackColor.withAlpha(150),
                borderRadius: BorderRadius.circular(66),
              ),
              child: ImageIcon(AssetImage(icon)),
            )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
