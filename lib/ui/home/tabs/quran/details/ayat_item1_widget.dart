import 'package:flutter/cupertino.dart';

import '../../../../../utils/app_styles.dart';

class AyatItem1Widget extends StatelessWidget {
  String content;

  AyatItem1Widget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: TextDirection.rtl,

      textAlign: TextAlign.center,
      content,
      style: AppStyles.bold20primary,
    );
  }
}
