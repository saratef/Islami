import 'package:flutter/cupertino.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class AyatItemWidget extends StatelessWidget {
  String content;
  int index;

  AyatItemWidget({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(hieght * .02),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: .7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        '$content ﴿ ${index + 1} ﴾',
        style: AppStyles.bold20primary,
      ),
    );
  }
}
