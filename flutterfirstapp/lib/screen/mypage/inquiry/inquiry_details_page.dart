import 'package:flutter/material.dart';

import '../../layout/simple_bar_layout.dart';
import 'inquiry_page.dart';


class InquiryDetailsPage extends StatelessWidget {
  const InquiryDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _titlecontroller = TextEditingController();
    final _contentcontroller = TextEditingController();
    return SimpleBarLayout(
      title: '문의 수정페이지',
      topIcon: null,
      children: [
        Expanded(
          child: Column(
            children: [
              TextField(
                controller: _titlecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 3,),
              Expanded(
                child: TextField(
                  controller: _contentcontroller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => InquiriesPage()),
                    );
                  },
                  child: Text('수정 하기')),
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => InquiriesPage()),
                    );
                  },
                  child: Text('삭제 하기')),
            ),
          ],
        )
      ],
    );
  }
}




