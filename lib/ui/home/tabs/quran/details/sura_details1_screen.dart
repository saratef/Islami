import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/providers/most_recent_provider.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/details/ayat_item1_widget.dart';
import 'package:islami_app/ui/home/tabs/quran/details/ayat_item_widget.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetails1Screen extends StatefulWidget {
  @override
  State<SuraDetails1Screen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetails1Screen> {
  String versesText = '';
  List<String> versesList = [];
  bool isLines = false;
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    super.dispose();
    mostRecentProvider.getMostRecentList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (isLines ? versesText.isEmpty : versesList.isEmpty) {
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
        actionsPadding: EdgeInsets.all(width * .04),
        actions: [
          InkWell(
            onTap: () {
              isLines = !isLines;
              setState(() {});
            },
            child: isLines
                ? Icon(Icons.line_weight_sharp)
                : Icon(Icons.filter_list),
            // ImageIcon(AssetImage(AppIcons.quranIcon))
          ),
        ],
      ),
      body: (isLines ? versesText.isEmpty : versesList.isEmpty)
          ? Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .04),
              child: Column(
                spacing: height * .02,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppImages.leftCorner),
                      Text(
                        QuranResourses.arabicQuranSuras[index],
                        style: AppStyles.bold24primary,
                      ),
                      Image.asset(AppImages.rightCorner),
                    ],
                  ),
                  Expanded(
                    child: isLines
                        ? SingleChildScrollView(
                            child: AyatItem1Widget(content: versesText),
                          )
                        : ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return AyatItemWidget(
                                content: versesList[index].trim(),
                                index: index,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                                  return SizedBox(height: height * .02);
                                },
                            itemCount: versesList.length,
                          ),
                  ),
                  Image.asset(AppImages.globalFooter),
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
    if (isLines) {
      for (int i = 0; i < lines.length; i++) {
        lines[i] = lines[i].trim();
        lines[i] += '﴿${i + 1}﴾';
      }
      versesText = lines.join('');
    } else {
      versesList = lines;
    }

    setState(() {});
  }
}
