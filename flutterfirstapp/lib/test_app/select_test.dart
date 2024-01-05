import 'package:flutter/material.dart';

import 'screen/test01_screen.dart';
import 'screen/test02_screen.dart';

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
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Test01Screen())),
                    child: const Text('테스트01')
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Test02Screen())),
                    child: const Text('테스트02')
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
