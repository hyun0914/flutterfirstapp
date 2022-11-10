import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../layout/simple_bar_layout.dart';
import 'my_review_writing_page.dart';


class MyReviewListPage extends StatefulWidget {
  const MyReviewListPage({Key? key}) : super(key: key);

  @override
  State<MyReviewListPage> createState() => _MyReviewListPageState();
}

class _MyReviewListPageState extends State<MyReviewListPage> {
  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
        title: '구매한 상품목록',
        topIcon: null,
        children: [
          Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 3));
                },
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      var price = NumberFormat('###,###,###');
                      return Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyReviewWritingPage()));
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset('name'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('제목 ', style: TextStyle(fontSize: 12,) ),
                                  Text('${price.format(int.parse('1000'))}' + '원', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Icon(Icons.grade, size: 10,),

                                  Text(' 4.5 ', style: TextStyle(fontSize: 11,)),
                                  Text('리뷰 14,912', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                              ClipRRect(borderRadius: BorderRadius.circular(3),
                                  child: Container(color: Colors.grey[300],
                                      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                                        child: Text('무료배송', style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                                      )))
                            ],
                          ),
                        ),
                      );
                    }),
              ))
        ]
    );
  }
}
