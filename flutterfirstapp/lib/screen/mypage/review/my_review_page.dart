import 'package:flutter/material.dart';

import '../../layout/simple_bar_layout.dart';
import 'my_review_details_page.dart';
import 'my_review_list_page.dart';

class MyReviewPage extends StatefulWidget {
  const MyReviewPage({Key? key}) : super(key: key);

  @override
  State<MyReviewPage> createState() => _MyReviewPageState();
}

class _MyReviewPageState extends State<MyReviewPage> {
  String get_id = '';

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '나의 리뷰',
      topIcon: null,
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 3));
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: ListTile(
                          title: Text('내용'),
                          subtitle: Text('날짜'),
                          trailing: Icon(Icons.navigate_next),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyReviewDetailsPage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: get_id ==''?
          SizedBox():
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyReviewListPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
              ),
              child: Text('리뷰 쓰기', style: TextStyle(fontSize: 20, color: Colors.white))),
        ),
      ],);
  }
}
