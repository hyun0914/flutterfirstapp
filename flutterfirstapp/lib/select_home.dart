import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'shopping_app/screen/main_page.dart';
import 'test_app/select_test.dart';

class SelectHome extends StatelessWidget {
  const SelectHome ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            // ios 페이지 이동 애니메이션을 안드로이드에서 적용하는 법
            // flutter cupertinopageroute
            // 참고사이트 https://gigas-blog.tistory.com/284
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }
        )
      ),
      home: const SelectHomeView(),
    );
  }
}

class SelectHomeView extends StatelessWidget {
  const SelectHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MainPage())),
                    child: const Text('쇼핑앱화면')
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SelectTest())),
                  child: const Text('테스트앱화면')
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

