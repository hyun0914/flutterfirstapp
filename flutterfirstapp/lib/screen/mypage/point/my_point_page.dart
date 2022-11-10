import 'package:flutter/material.dart';
import 'package:flutterfirstapp/screen/mypage/point/point_information_page.dart';

import '../../layout/simple_bar_layout.dart';

class MyPointPage extends StatelessWidget {
  const MyPointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      fontWeight: FontWeight.w700,
    );

    return SimpleBarLayout(
      title: '초록도시 포인트',
      topIcon: null,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('사용가능한 포인트', style: ts.copyWith(fontSize: 15),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text('1000p', style: ts.copyWith(fontSize: 25)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('포인트 사용내역', style: ts.copyWith(fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PointInformationPage()),
                      );
                    },
                    child: Text('초록도시포인트안내', style: TextStyle(fontSize: 11),),
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 3));
            },

            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('포인트 내역이 없습니다.', style: TextStyle(
            //       fontSize: 15,
            //     ),),
            //   ],
            // ),

            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 40,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text('포인트사용', style: ts.copyWith(fontSize: 13),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text('500'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
