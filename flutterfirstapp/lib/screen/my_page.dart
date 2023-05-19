import 'dart:async';

import 'package:flutter/material.dart';
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

String loginCheck = 'false'; //false true


class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
             child: Column(
               children: [
                 Container(
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey.shade400),
                     borderRadius: const BorderRadius.all(Radius.circular(6)),
                   ),
                   padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                   child: Column(
                     children: [
                       loginCheck == 'false'?
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Container(
                             padding: const EdgeInsets.only(left: 25,),
                             child: const ClipOval(
                               child: SizedBox(
                                 width: 100,
                                 height: 100,
                                 child: Icon(
                                   Icons.account_circle_sharp,
                                   size: 70,
                                 ),
                               ),
                             ),
                           ),
                           Expanded(
                             flex: 2,
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
                                 child: const Column(children: [
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
                                     style: TextStyle(fontSize: 12),
                                   ),
                                   SizedBox(
                                     height: 3,
                                   ),
                                   Text(
                                     '자유롭게 이용해보세요',
                                     style: TextStyle(fontSize: 12),
                                   ),
                                 ])),
                           ),
                         ],
                       )
                           : Container(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             ClipOval(
                               child: SizedBox(
                                 width: 100,
                                 height: 100,
                                 child: Image.asset(
                                   'assets/chicken.jpg',
                                   fit: BoxFit.fill,
                                 ),
                               ),
                             ),
                             Column(
                               children: [
                                 const Text('닉네임', style: TextStyle(fontSize: 20,),),
                                 const SizedBox(height: 12,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     const Text(
                                       '팔로워  4444',
                                       style: TextStyle(
                                         fontSize: 14,
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
                                     const Text(
                                       '팔로잉  4444',
                                       style: TextStyle(
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(
                           top: 15,
                           bottom: 10,
                         ),
                         child: Container(
                           color: Colors.grey[300],
                           height: 1,
                         ),
                       ),
                       Row(
                         children: [
                           Container(
                             padding: const EdgeInsets.only(left: 15, bottom: 10),
                             child: Text('나의 쇼핑', style: TextStyle(fontSize: 20,)),
                           ),
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8),
                         child: Container(
                           decoration: BoxDecoration(
                               color: Colors.grey.shade200,
                               borderRadius: BorderRadius.circular(8)
                           ),
                           padding: const EdgeInsets.only(top: 15, bottom: 15,),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               myShopping(
                                   context,
                                       () => Navigator.push(context, MaterialPageRoute(builder: (_) => OrderDeliveryLookupPage())),
                                   '주문배송조회'
                               ),
                               Container(
                                 color: Colors.grey.shade300,
                                 width: 2,
                                 height: 20,
                               ),
                               myShopping(
                                   context,
                                       () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyCouponPage())),
                                   '내쿠폰'
                               ),
                               Container(
                                 color: Colors.grey.shade300,
                                 width: 2,
                                 height: 20,
                               ),
                               myShopping(
                                   context,
                                       () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyPointPage())),
                                   '포인트'
                               ),
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),

                 const SizedBox(height: 14,),
                 listTileForm('문의내역',
                       (){Navigator.push(context, MaterialPageRoute(builder: (context) => InquiriesPage()));},),
                 listTileForm('나의 리뷰',
                       (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyReviewPage()));},),
                 listTileForm('고객센터',
                       (){Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceCenterPage()));},),
                 listTileForm('설정',
                       (){Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));},),
               ],
             ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget myShopping(BuildContext context, VoidCallback onPressed, String text) {
  return Expanded(
    flex: 1,
    child: TextButton(
      onPressed: onPressed,
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
          SizedBox(height: 11,),
          Text(text),
        ],
      ),
    ),
  );
}

Widget listTileForm(String ltText, VoidCallback callback){
  return Column(
    children: [
      ListTile(
        title: Text(ltText),
        trailing: Icon(Icons.navigate_next),
        onTap: callback,
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
  );
}
