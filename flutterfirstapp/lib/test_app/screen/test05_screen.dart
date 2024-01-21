import 'package:flutter/material.dart';

// Drawer의 상태 확인
// scaffoldKey.currentState!.isDrawerOpen
// scaffoldKey.currentState!.isEndDrawerOpen
// 참고사이트
// https://stackoverflow.com/questions/60314156/close-navigation-drawer-on-back-button-pressed-in-flutter

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Test05Screen extends StatelessWidget {
  const Test05Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      endDrawer: const Drawer(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if(!scaffoldKey.currentState!.isEndDrawerOpen) {
              scaffoldKey.currentState!.openEndDrawer();
            }
            print(scaffoldKey.currentState!.isDrawerOpen);
            print(scaffoldKey.currentState!.isEndDrawerOpen);
          },
          child: Container(
            child: Center(
              child: Text('Drawer 열기'),
            ),
          )
        ),
      ),
    );
  }
}
