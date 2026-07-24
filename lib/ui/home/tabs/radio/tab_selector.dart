import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_strings.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class TabSelector extends StatefulWidget {
  final ValueChanged<int>? onChanged;

  const TabSelector({super.key, this.onChanged});

  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height(context) * .05,
      decoration: BoxDecoration(
        color: AppColors.transBlackColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _tabItem(AppStrings.radio, 0),
          _tabItem(AppStrings.reciters, 1),
        ],
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    final bool isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedTab = index);
          widget.onChanged?.call(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppStyles.bold16white.copyWith(
              color: isSelected ? AppColors.blackColor : AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
