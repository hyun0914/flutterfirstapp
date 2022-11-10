import 'package:flutter/material.dart';
import '../layout/simple_bar_layout.dart';

class BannerDetailsPage extends StatelessWidget {
  final String imgName;
  const BannerDetailsPage({
    required this.imgName,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
        title: '광고',
        topIcon: null,
        children: [
          Container(
            child: Image.asset(
              imgName,
              fit: BoxFit.fill,
            ),
          )
        ],
    );
  }
}
