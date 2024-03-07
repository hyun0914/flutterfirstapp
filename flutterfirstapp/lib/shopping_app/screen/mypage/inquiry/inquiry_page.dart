import 'package:flutter/material.dart';

import '../../layout/simple_bar_layout.dart';
import '../login_page.dart';
import 'inquiry_details_page.dart';
import 'inquiry_write_page.dart';

class InquiriesPage extends StatefulWidget {
  const InquiriesPage({Key? key}) : super(key: key);

  @override
  State<InquiriesPage> createState() => _InquiriesPageState();
}

class _InquiriesPageState extends State<InquiriesPage> {

  String get_id = '';
  int idCount = 0;

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '문의 내역',
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
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: ListTile(
                          title: Text('제목'),
                          subtitle: Text('날짜'),
                          trailing: Icon(Icons.navigate_next),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  InquiryDetailsPage()
                              ),
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
          const SizedBox():
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InquiryWritePage()),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
            ),
            child: Text('문의 하기', style: TextStyle(fontSize: 20, color: Colors.white),)
          ),
        ),
      ],
    );
  }
}
