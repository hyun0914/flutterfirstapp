import 'package:flutter/material.dart';

import '../../layout/simple_bar_layout.dart';

class InquiryWritePage extends StatefulWidget {
  const InquiryWritePage({Key? key}) : super(key: key);

  @override
  State<InquiryWritePage> createState() => _InquiryWritePageState();
}

class _InquiryWritePageState extends State<InquiryWritePage> {

  final _titlecontroller = TextEditingController();
  final _contentcontroller = TextEditingController();
  String get_id = '';

  @override
  void dispose() {
    _titlecontroller.dispose();
    _contentcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '문의 글작성',
      topIcon: null,
      children: [
        Expanded(
          child: Column(
            children: [
              TextField(
                controller: _titlecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '제목을 입력해주세요',
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Expanded(
                child: TextField(
                  controller: _contentcontroller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '내용을 적어주세요',
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('작성 완료')),
            ),
          ],
        )
      ],
    );
  }
}
