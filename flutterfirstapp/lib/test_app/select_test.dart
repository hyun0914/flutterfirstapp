import 'package:flutter/material.dart';

import 'screen/boxfit_screen.dart';
import 'screen/package_widget01_screen.dart';
import 'screen/default_widget01_screen.dart';
import 'screen/date_related_screen.dart';
import 'screen/tab_bar_screen.dart';
import 'screen/scaffold_screen.dart';
import 'screen/random_related_screen.dart';
import 'screen/calendar_widget_screen.dart';
import 'screen/hero_screen.dart';

class SelectTest extends StatelessWidget {
  const SelectTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HeroScreen())),
                  testTile: 'Hero'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const BoxFitScreen())),
                  testTile: 'Boxfilt'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PackageWidget01Screen())),
                  testTile: '패키지 위젯'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DefaultWidget01Screen())),
                  testTile: '기본 위젯'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DateRelatedScreen())),
                  testTile: '날짜관련'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TabBarScreen())),
                  testTile: '탭바'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ScaffoldScreen())),
                  testTile: 'Scaffold'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RandomRelatedScreen())),
                  testTile: '랜덤관련'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CalendarWidgetScreen())),
                  testTile: '달력위젯'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CalendarWidgetScreen())),
                  testTile: '앱 라이프 사이클'
                ),

              ],
            ),
          )
      ),
    );
  }
}

Widget textPushBtn({
  required BuildContext context,
  required void Function() onPressed,
  required String testTile,
}) {
  return   Center(
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(testTile)
    ),
  );
}