import 'package:flutter/material.dart';

import 'tab_bar/tab_bar_first_view.dart';
import 'tab_bar/tab_bar_second_view.dart';
import 'tab_bar/tab_bar_third_view.dart';

// TabBar 참고사이트
// https://eunoia3jy.tistory.com/110
// https://dkswnkk.tistory.com/200
// https://jinhan38.com/140?category=978038
// https://docs.flutter.dev/cookbook/design/tabs

List<String> tabsText = ['첫번 째', '두번 째', '세번 째'];

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsText.length,
      child: Scaffold(
        appBar: AppBar(
         bottom: TabBar(
           indicatorPadding: EdgeInsets.only(left: 2, right: 2),
           indicatorColor: const Color.fromRGBO(0, 109, 72, 1),
           labelColor: const Color.fromRGBO(0, 109, 72, 1),
           unselectedLabelColor: const Color.fromRGBO(101, 101, 101, 1),
           tabs: [
             for(int i=0; i<tabsText.length; i++)
             Text(tabsText[i]),
           ],
         ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              TabBarFirstView(),
              TabBarSecondView(),
              TabBarThirdView(),
            ],
          ),
        ),
      ),
    );
  }
}
