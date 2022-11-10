import 'package:flutter/material.dart';

import '../layout/simple_bar_layout.dart';


class SearchNextPage extends StatelessWidget {
  final String get_test;
  const SearchNextPage({
    required this.get_test,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SimpleBarLayout(
        title: '검색결과',
        topIcon: null,
        children: [
          Container(
            child: Center(child: Text('${get_test}')),
          ),
        ]
    );
  }
}
