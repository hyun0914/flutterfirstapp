import 'package:flutter/material.dart';

import '../../layout/simple_bar_layout.dart';
import 'point_information_page.dart';

final ts = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
);

class MyPointPage extends StatelessWidget {
  const MyPointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '포인트',
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
                    child: Text('사용가능한 포인트', style: ts,),
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
                  child: Text('포인트 사용내역', style: ts),
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
                    child: Text('포인트안내', style: TextStyle(fontSize: 11),),
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
              padding: EdgeInsets.symmetric(horizontal: 12),
              physics: BouncingScrollPhysics(),
              itemCount: 40,
              itemBuilder: (context, int index) {
                return pointHistory();
              },
            ),
          ),
        ),
      ],
    );
  }
}

Widget pointHistory() {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(7),
              child: Text('사용', style: ts.copyWith(fontSize: 13),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text('500', style: ts.copyWith(fontSize: 18),),
            ),
          ],
        ),
      ],
    ),
  );
}
