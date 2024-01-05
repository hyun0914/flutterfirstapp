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

