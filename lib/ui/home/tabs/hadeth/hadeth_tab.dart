import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeeth_item.dart';

class HadethTab extends StatelessWidget {

  HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    // TODO: implement build
    return CarouselSlider(


      options: CarouselOptions(height: height * .66,
          enlargeCenterPage: true,
          enableInfiniteScroll: false),
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadeethItem(index: index);
      }).toList(),
    );
  }

}
