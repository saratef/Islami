import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_text_widget.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../model/hadeth_model.dart';

class HadeethItem extends StatefulWidget {
  int index;

  HadeethItem({super.key, required this.index});

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    super.initState();
    loadHadeethFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        left: width * .02,
        right: width * .02,
        top: height * .01,
      ),

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.hadethBg)),
        borderRadius: BorderRadius.circular(24),
        color: AppColors.primaryColor,
      ),
      margin: EdgeInsets.only(bottom: height * .01),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(color: AppColors.blackColor),
            )
          : Column(
              spacing: height * .02,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: width * .22,
                      AppImages.leftCorner,
                      color: AppColors.blackColor,
                    ),
                    Expanded(
                      child: HadethTextWidget(
                        text: hadeth?.title ?? '',
                        textStyle: AppStyles.bold22blackElmessiri,
                      ),
                    ),
                    Image.asset(
                      width: width * .22,
                      AppImages.rightCorner,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: HadethTextWidget(
                      text: '${hadeth?.content ?? ''}',
                      textStyle: AppStyles.bold14blackElmessiri,
                    ),
                  ),
                ),
                Image.asset(AppImages.hadethfooter),
              ],
            ),
    );
  }

  void loadHadeethFile() async {
    String hadeethContent = await rootBundle.loadString(
      'assets/files/Hadeeth/h${widget.index}.txt',
    );
    String title = hadeethContent.substring(0, hadeethContent.indexOf('\n'));
    String content = hadeethContent.substring(hadeethContent.indexOf('\n') + 1);
    hadeth = Hadeth(title: title, content: content);
    print(title);
    setState(() {});
    // List<String> lines = hadeethContent.split('\n');
    // String title = lines[0];
    // String content = lines.removeAt(0);
  }
}
