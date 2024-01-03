import 'package:flutter/material.dart';

import '../layout/simple_bar_layout.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '이미지 상세',
      topIcon: [],
      children: [
        InteractiveViewer(child: Image.asset('assets/pizza.png')),
      ],
    );
  }
}
