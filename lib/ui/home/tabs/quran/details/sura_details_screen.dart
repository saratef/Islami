import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/details/ayat_item_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        foregroundColor: AppColors.primaryColor,
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
        title: Text(
          QuranResourses.englishQuranSurahs[index],
          style: AppStyles.bold24primary,
        ),
      ),
      body: verses.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .04),
              child: Column(
                spacing: hieght * .02,
                children: [
                  Text(
                    QuranResourses.arabicQuranSuras[index],
                    style: AppStyles.bold24primary,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return AyatItemWidget(
                          content: verses[index].trim(),
                          index: index,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: hieght * .02);
                      },
                      itemCount: verses.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/Suras/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    verses = lines;
    setState(() {});
  }
}
