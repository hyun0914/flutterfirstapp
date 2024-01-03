import 'package:flutter/material.dart';
import '../../layout/simple_bar_layout.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
        title: '이용약관',
        topIcon: null,
        children: [
          Text('이용약관')
        ]
    );
  }
}
