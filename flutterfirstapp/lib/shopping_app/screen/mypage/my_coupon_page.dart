import 'package:flutter/material.dart';
import '../layout/simple_bar_layout.dart';

class MyCouponPage extends StatelessWidget {
  const MyCouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '쿠폰',
      topIcon: null,
      children: [
        Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 3));
              },
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 15),
                        child: Row(
                          children: [
                            Text('쿠폰등록',),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '쿠폰코드를 입력해주세요',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                  onPressed: (){},
                                  child: Text('등록', style: TextStyle(fontSize: 15),)),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            children: [
                              Text('10% 할인쿠폰'),
                              Text('2022년 08월 31일까지'),
                              Text('5,000원 이상 구매시')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            children: [
                              Text('10% 할인쿠폰'),
                              Text('2022년 08월 31일까지'),
                              Text('5,000원 이상 구매시')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            children: [
                              Text('10% 할인쿠폰'),
                              Text('2022년 08월 31일까지'),
                              Text('5,000원 이상 구매시')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            children: [
                              Text('10% 할인쿠폰'),
                              Text('2022년 08월 31일까지'),
                              Text('5,000원 이상 구매시')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            children: [
                              Text('10% 할인쿠폰'),
                              Text('2022년 08월 31일까지'),
                              Text('5,000원 이상 구매시')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            children: [
                              Text('10% 할인쿠폰'),
                              Text('2022년 08월 31일까지'),
                              Text('5,000원 이상 구매시')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            children: [
                              Text('10% 할인쿠폰'),
                              Text('2022년 08월 31일까지'),
                              Text('5,000원 이상 구매시')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),),
      ],
    );
  }
}
