import 'package:flutter/material.dart';
import '../../main_page.dart';
import '../layout/simple_bar_layout.dart';
import '../reply/reply_page.dart';
import 'community_edit_page.dart';

class CommunityDetails extends StatefulWidget {

  const CommunityDetails({Key? key}) : super(key: key);

  @override
  State<CommunityDetails> createState() => _CommunityDetailsState();
}

List get_imgeNameAll = [];

class _CommunityDetailsState extends State<CommunityDetails> {

  String show_id ='';
  String show_name = '';

  bool likeclick = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
        title: '',
        topIcon: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(context: context, builder: (_){
                return Container(
                  height: 200,
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey.shade300,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                child: Row(
                                  children: [
                                    Icon(Icons.bookmark),
                                    SizedBox(width: 4,),
                                    Text('해당 스토리 북마크 생성', style: TextStyle(fontSize: 17),),
                                  ],
                                )),
                            SizedBox(height: 10,),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommunityEditPage())),
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(width: 4,),
                                      Text('스토리 수정', style: TextStyle(fontSize: 17),),
                                    ],
                                  )),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => MainPage()),
                                            (route) => false);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(width: 4,),
                                      Text('스토리 삭제', style: TextStyle(fontSize: 17),),
                                    ],
                                  )),
                            ),

                            InkWell(
                                child: Row(
                                  children: [
                                    Icon(Icons.priority_high),
                                    SizedBox(width: 4,),
                                    Text('스토리 신고', style: TextStyle(fontSize: 17),),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                  ),
                );
              });
            },
            icon: Icon(Icons.more_horiz),
          ),
        ],
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                                child: Text('글제목', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                              ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipOval(child: Image.asset('assets/hen.png', fit: BoxFit.fill, width: 15, height: 15,)),
                                SizedBox(width: 4,),
                                Text('닉네임', style: TextStyle(fontSize: 12),),
                                SizedBox(width: 4,),
                                Text('날짜', style: TextStyle(fontSize: 12),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      //Image.asset(name);
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
                subimageSliverList(context),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 12),
                              child: Text('글 내용'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      if(likeclick == false){
                        likeclick = true;
                      } else if(likeclick == true){
                        likeclick = false;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      likeclick == false? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Colors.red,),
                      SizedBox(width: 4,),
                      Text('좋아요')
                    ],
                  ),
                ),

                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ReplyPage())),
                  child: Row(
                    children: [
                      Icon(Icons.chat_bubble_outline),
                      SizedBox(width: 4,),
                      Text('댓글달기')
                    ],
                  ),
                ),

                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(Icons.send),
                      SizedBox(width: 4,),
                      Text('공유하기')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
    );
  }
}

SliverList subimageSliverList(BuildContext context){
  return SliverList(
    delegate: SliverChildBuilderDelegate(
        (context, index){
          return Image.asset('assets/pizza.png');
        },
      childCount:  2,
    ),
  );
}
