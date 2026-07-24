import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_list.dart';
import 'package:islami_app/ui/home/tabs/radio/reciters_list.dart';
import 'package:islami_app/ui/home/tabs/radio/tab_selector.dart';

import '../../../../utils/app_colors.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    RadioList(),
    RecitersList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 20),

              TabSelector(
                onChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),

              const SizedBox(height: 16),

              Expanded(
                child: tabs[selectedIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}