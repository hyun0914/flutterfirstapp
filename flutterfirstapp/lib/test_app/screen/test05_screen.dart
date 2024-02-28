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
      appBar: AppBar(
        // centerTitle
        // true - 중앙 정렬
        // false - 왼쪽 정렬
        // ios 기본설정이 중앙정렬, aos 기본설정이 왼쪽정렬
        // 참고사이트
        // https://islet4you.tistory.com/entry/Flutter-AppBar-title-center-%EB%A1%9C-%EB%A7%9E%EC%B6%B0%EC%A3%BC%EA%B8%B0
        centerTitle: true,
        title: Text('test05'),
      ),
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
            child: const Center(
              child: Text('Drawer 열기'),
            ),
          )
        ),
      ),
    );
  }
}
