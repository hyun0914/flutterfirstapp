import 'package:flutter/material.dart';

import 'screen/gradient_shadow.dart';

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
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => GradientShadow())),
                      child: Text('그라데이션, 그림자 테스트')
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
