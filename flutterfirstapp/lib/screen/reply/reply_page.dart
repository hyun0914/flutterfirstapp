import 'package:flutter/material.dart';
import '../home/home_community_page.dart';
import '../layout/simple_bar_layout.dart';

class ReplyPage extends StatefulWidget {
  const ReplyPage({Key? key}) : super(key: key);

  @override
  State<ReplyPage> createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  final _replyController = TextEditingController();
  String show_id ='';
  String show_name = '';

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
        title: '댓글',
        topIcon: null,
        children: [
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder:(context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(child: Image.asset('assets/pizza.png', fit: BoxFit.fill, width: 20, height: 20,)),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('닉네임'),
                                      SizedBox(width: 8,),
                                      Text('날짜', style: TextStyle(fontSize: 9),),
                                    ],
                                  ),
                                  SizedBox(height: 4,),
                                  Text('내용'),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Icon(Icons.favorite, size: 9,),
                                      SizedBox(width: 2,),
                                      Text('0', style: TextStyle(fontSize: 9),),
                                      SizedBox(width: 8,),
                                      Text('답글달기', style: TextStyle(fontSize: 9),),
                                      SizedBox(width: 8,),
                                      Text('신고', style: TextStyle(fontSize: 9),),
                                    ],
                                  ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     IconButton(onPressed: (){
                              //       showAdaptiveActionSheet(
                              //         context: context,
                              //         actions: <BottomSheetAction>[
                              //           BottomSheetAction(
                              //               title: Text('수정'),
                              //               onPressed: (context){
                              //
                              //               }),
                              //           BottomSheetAction(
                              //               title: Text('삭제'),
                              //               onPressed: (context){
                              //                 replyViewModel.onEvent(ReplyEvent.reply_delete('${post.rep_writer_id}', '${post.rep_title}'));
                              //               }),
                              //         ],
                              //         cancelAction: CancelAction(title: Text('취소')),
                              //       );
                              //     }, icon: Icon(Icons.more_vert))
                              //   ],
                              // )
                            ],
                          ),
                        ],
                      ),
                    );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 35),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: _replyController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '댓글을 입력해주세요',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: (){
                          //showToatst('댓글등록 완료');
                        }, child: Text('등록', style: TextStyle(fontSize: 17, color: Colors.white),))
                  ),
                ),
              ],
            ),
          ),
        ]
    );
  }
}
