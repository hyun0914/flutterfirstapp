import 'dart:async';

import 'package:flutter/material.dart';
import 'layout/simple_bar_layout.dart';
import 'mypage/inquiry/inquiry_page.dart';
import 'mypage/login_page.dart';
import 'mypage/my_coupon_page.dart';
import 'mypage/order_delivery_lookup_page.dart';
import 'mypage/point/my_point_page.dart';
import 'mypage/review/my_review_page.dart';
import 'mypage/servicecenter_page.dart';
import 'mypage/setting/setting_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

String loginCheked = 'false';
String get_id = '';
String show_name = '';
String show_badge = '';
String show_follower = '';
String show_following = '';
String get_pic = '';

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // 로그아웃상태
                        if (loginCheked == 'false') ...[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                            ),
                            child: ClipOval(
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.lock,
                                  size: 70,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: TextButton(
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.grey;
                                      }
                                      return Colors.black;
                                    }),
                                  ),
                                  child: Column(children: [
                                    Text(
                                      '로그인 & 회원가입',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '로그인 하고 서비스를',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '자유롭게 이용해보세요',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ])),
                            ),
                          ),
                        ],

                        // 로그인 상태
                        if (loginCheked == 'true') ...[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                            ),
                            child: ClipOval(
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                  'assets/image/Flowerpot.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  '${show_name}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '팔로워' + '${show_follower}',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      child: Container(
                                        width: 1,
                                        height: 10,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Text(
                                      '팔로잉' + '${show_following}',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      child: Container(
                                        width: 1,
                                        height: 10,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Text(
                                      '벳지x' + '${show_badge}',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 10,
                      ),
                      child: Container(
                        color: Colors.grey[300],
                        height: 3,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            '나의 쇼핑',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDeliveryLookupPage()),
                                );
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.grey;
                                  }
                                  return Colors.black;
                                }),
                              ),
                              child: Column(
                                children: [
                                  Text('0'),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Text('주문배송조회'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyCouponPage()),
                                );
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.grey;
                                  }
                                  return Colors.black;
                                }),
                              ),
                              child: Column(
                                children: [
                                  Text('0'),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Text('내쿠폰'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyPointPage()),
                                );
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.grey;
                                  }
                                  return Colors.black;
                                }),
                              ),
                              child: Column(
                                children: [
                                  Text('0'),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Text('포인트'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        color: Colors.grey[300],
                        height: 3,
                      ),
                    ),
                    ListTile(
                      title: Text('문의내역'),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InquiriesPage()),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        color: Colors.grey[300],
                        height: 3,
                      ),
                    ),
                    ListTile(
                      title: Text('나의 리뷰'),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyReviewPage()),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        color: Colors.grey[300],
                        height: 3,
                      ),
                    ),
                    ListTile(
                      title: Text('고객센터'),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceCenterPage()),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        color: Colors.grey[300],
                        height: 3,
                      ),
                    ),
                    ListTile(
                      title: Text('설정'),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingPage()),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        color: Colors.grey[300],
                        height: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
