import 'package:flutter/material.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/size_utils.dart';

class RadioItemCard extends StatefulWidget {
  String name;

  RadioItemCard({super.key, required this.name});

  @override
  State<RadioItemCard> createState() => _RadioItemCardState();
}

class _RadioItemCardState extends State<RadioItemCard> {
  bool isMute = false;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height(context) * .2,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: isPlaying
                ? Image.asset(
                    AppImages.audio,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    AppImages.hadethfooter,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.name, style: AppStyles.bold24black),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ImageIcon(
                        AssetImage(isPlaying ? AppIcons.play : AppIcons.puse),
                        size: 32,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.width(context) * .05),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        isMute = !isMute;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ImageIcon(
                        AssetImage(
                          isMute ? AppIcons.muteVolume : AppIcons.highVolume,
                        ),
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
