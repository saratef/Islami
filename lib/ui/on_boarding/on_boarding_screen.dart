import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/on_boarding/on_boarding_model.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_strings.dart';

import '../../utils/app_styles.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    PageDecoration pageDecoration = PageDecoration(
      imageFlex: 3,
      titleTextStyle: AppStyles.onBoardingTitleStyle,
      bodyTextStyle: AppStyles.onBoardingBodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),

      pageColor: AppColors.blackColor,
      imagePadding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .25,
      ),
      footerPadding: EdgeInsets.symmetric(vertical: 24.0),

      // titlePadding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.15)
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.blackColor,

      allowImplicitScrolling: true,
      globalHeader: SafeArea(
        child: Image.asset(AppImages.globalHeader, height: 170),
      ),
      pages: [
        PageViewModel(
          title: onBoardingList[0].title,
          body: "",
          image: Center(child: Image.asset(onBoardingList[0].image)),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: onBoardingList[1].title,
          body: onBoardingList[1].body,
          image: Image.asset(onBoardingList[1].image),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: onBoardingList[2].title,
          body: onBoardingList[2].body,
          image: Image.asset(onBoardingList[2].image),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: onBoardingList[3].title,
          body: onBoardingList[3].body,
          image: Image.asset(onBoardingList[3].image),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: onBoardingList[4].title,
          body: onBoardingList[4].body,
          image: Image.asset(onBoardingList[4].image),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: Text(
        AppStrings.backButton,
        style: AppStyles.onBoardingControllersStyle,
      ),
      skip: Text('Skip', style: AppStyles.onBoardingControllersStyle),
      next: Text(
        AppStrings.nextButton,
        style: AppStyles.onBoardingControllersStyle,
      ),
      done: Text('Done', style: AppStyles.onBoardingControllersStyle),

      curve: Curves.fastLinearToSlowEaseIn,
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(7, 7),
        color: AppColors.greyColor,
        activeSize: Size(22.0, 10.0),
        activeColor: AppColors.primaryColor,
        activeShape: RoundedRectangleBorder(
          side: BorderSide(width: 1),

          borderRadius: BorderRadius.all(Radius.circular(27.0)),
        ),
      ),
    );
  }

  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      title: AppStrings.onBoardingTitle1,
      image: AppImages.onBoardingImage1,
    ),
    OnBoardingModel(
      title: AppStrings.onBoardingTitle1,
      body: AppStrings.onBoardingBody2,
      image: AppImages.onBoardingImage2,
    ),
    OnBoardingModel(
      title: AppStrings.onBoardingTitle3,
      body: AppStrings.onBoardingBody3,
      image: AppImages.onBoardingImage3,
    ),
    OnBoardingModel(
      title: AppStrings.onBoardingTitle4,
      body: AppStrings.onBoardingBody4,
      image: AppImages.onBoardingImage4,
    ),
    OnBoardingModel(
      title: AppStrings.onBoardingTitle5,
      body: AppStrings.onBoardingBody5,
      image: AppImages.onBoardingImage5,
    ),
  ];
}
