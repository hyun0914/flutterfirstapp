import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../banner/banner_page.dart';
import 'community_details.dart';


class HomeCommunityPage extends StatefulWidget {
  const HomeCommunityPage({Key? key}) : super(key: key);

  @override
  State<HomeCommunityPage> createState() => _HomeCommunityPageState();
}

// web에서 Horizontal scrolling 사용하기 위해 생성한 class
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

int childCount = 10;

class _HomeCommunityPageState extends State<HomeCommunityPage> {
  bool click = false;

  @override
  void dispose() {
    print('home dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                   child: Column(
                     children: [
                       Container(
                         color: Colors.grey[300],
                         height: 2,
                       ),
                       // 광고
                       Container(
                         padding: const EdgeInsets.all(8.0),
                         child: const SizedBox(
                           height: 120,
                           child: BannerPage(imgList: [
                             'assets/sale.png',
                             'assets/screen.png',
                           ],),
                         ),
                       ),
                       Container(
                         color: Colors.grey[300],
                         height: 8,
                       ),
                       // Top 10
                       Container(
                         padding: const EdgeInsets.only(top: 18, left: 17),
                         child: const Row(
                           children: [
                             Text('이번주에 가장 인기 많은 스토리는?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                           ],
                         ),
                       ),
                       Container(
                         padding: const EdgeInsets.only(top: 8, bottom: 8),
                         child: SizedBox(height: 180, child: topTenImg(context)),
                       ),
                       Container(
                         color: Colors.grey[300],
                         height: 8,
                       ),
                       Container(
                         padding: const EdgeInsets.only(top: 15, bottom: 15, left: 17),
                         child: const Row(
                           children: [
                             Text('최근스토리에요~', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                           ],
                         ),
                       ),
                     ],
                   )
                ),
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        (context, index){
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommunityDetails()));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(13, 7, 13, 7),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/chicken.jpg'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(13, 0, 13, 7),
                                  child: Column(
                                    children: [
                                      Text(
                                        '글제목 $index',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(child: Image.asset('assets/hen.png', fit: BoxFit.fill, width: 15, height: 15,)),
                                              SizedBox(width: 5,),
                                              Text('닉네임', style: TextStyle(fontSize: 12),),
                                            ],
                                          ),
                                          Text('좋아요 0', style: TextStyle(fontSize: 12),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount : childCount,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              childCount = childCount +8;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: EdgeInsets.all(15),
                            child: const Center(
                              child: Text('더보기'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('회사명', style: TextStyle(fontSize: 18),),
                            SizedBox(height: 10,),
                            Text('대표 ...', style: TextStyle(fontSize: 12),),
                            SizedBox(height: 4,),
                            Text('사업자등록번호', style: TextStyle(fontSize: 12),),
                            SizedBox(height: 4,),
                            Text('통신판매업신고번호', style: TextStyle(fontSize: 12),),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Text('주소', style: TextStyle(fontSize: 12),),
                                SizedBox(height: 4,),
                                Text('대구 광역시', style: TextStyle(fontSize: 12),),
                                SizedBox(height: 4,),
                              ],
                            ),
                            Row(
                              children: [
                                Text('연락메일', style: TextStyle(fontSize: 12),),
                                SizedBox(width: 10,),
                                Text('xxxxxxxx@xxxx.com', style: TextStyle(fontSize: 12),),
                                SizedBox(height: 4,),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text('통신판매중개자로 거래 당사자가 아니므로, 판매가자 등록한 상품정보 및 거래등에 대해 책임을 지지 않습니다.'
                                ' 단, 초록도시가 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다.', style: TextStyle(fontSize: 12),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('이용약관', style: TextStyle(fontSize: 12),),
                                SizedBox(width: 10,),
                                Text('개인정보처리방침', style: TextStyle(fontSize: 12),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ) ,
          ),
        ),
      ],
    );
  }

  ScrollConfiguration topTenImg(BuildContext context){
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index){
            return Stack(
              children: [
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.all(7.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommunityDetails()));
                      },
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(3.0),
                        child: Image.asset('assets/pizza.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  child: Container(
                    width: 150,
                    child: Text('제목',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}

  void showToatst(String messsage) {
    Fluttertoast.showToast(
        msg: messsage,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM
    );
  }
  
