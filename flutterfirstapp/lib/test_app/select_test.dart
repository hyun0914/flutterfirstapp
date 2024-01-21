import 'package:flutter/material.dart';

import 'screen/test01_screen.dart';
import 'screen/test02_screen.dart';
import 'screen/test03_screen.dart';
import 'screen/test04_screen.dart';
import 'screen/test05_screen.dart';

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
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Test01Screen())),
                  testTile: '테스트01'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Test02Screen())),
                  testTile: '테스트02'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Text03Screen())),
                  testTile: '테스트03'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Test04Screen())),
                  testTile: '테스트04'
                ),
                textPushBtn(
                  context: context,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Test05Screen())),
                  testTile: '테스트05'
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