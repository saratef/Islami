import 'package:flutter/cupertino.dart';

class HadethTextWidget extends StatelessWidget {
  String text;
  TextStyle textStyle;

  HadethTextWidget({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
