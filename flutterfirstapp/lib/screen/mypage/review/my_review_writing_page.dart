import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../layout/simple_bar_layout.dart';

class MyReviewWritingPage extends StatefulWidget {
  const MyReviewWritingPage({Key? key}) : super(key: key);

  @override
  State<MyReviewWritingPage> createState() => _MyReviewWritingPageState();
}

class _MyReviewWritingPageState extends State<MyReviewWritingPage> {

  bool clickicon = false;
  bool clickicon2 = false;
  bool clickicon3 = false;
  bool clickicon4 = false;
  bool clickicon5 = false;


  final List<String> items = [
    '0.5',
    '1',
    '1.5',
    '2',
    '2.5',
    '3',
    '3.5',
    '4',
    '4.5',
    '5'
  ];
  String? selectedValue;

  String starNumber = '0';
  String get_id = '';
  String get_name = '';

  final _contentcontroller = TextEditingController();

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void showToatst(String messsage) {
    Fluttertoast.showToast(
        msg: messsage,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '리뷰 작성',
      topIcon: null,
      children: [
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                    child: Row(
                      children: [
                        Text('이름', style: TextStyle(fontSize: 25),),
                        SizedBox(width: 15,),
                        Icon(Icons.star),
                        DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text('별점'),
                              items: items.map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                ),
                              ),
                              ).toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState((){
                                  selectedValue = value as String;
                                });
                              },
                            )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/2,
                    child: TextField(
                      controller: _contentcontroller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '리뷰내용을 적어주세요',
                      ),
                    ),
                  ),
                  // Container(
                  //     child: _imageFile == null ?
                  //     Text('리뷰이미지없습니다.'):
                  //     Image(image: FileImage((File(_imageFile!.path))) as ImageProvider,)
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: (){
                  //           //showModalBottomSheet(context: context,  builder: (builder) => bottomsheet());
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.green,
                  //         ),
                  //         child: Text('이미지 선택',style: TextStyle(fontSize: 20, color: Colors.white)),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //imgFrom(),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('작성 완료', style: TextStyle(fontSize: 20, color: Colors.white))),
            ),
          ],
        )
      ],);
  }

  // Widget bottomsheet() {
  //   return Container(
  //     height: 100,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     child: Column(
  //       children: [
  //         Text(
  //           '이미지 선택',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             IconButton(
  //               onPressed: () {
  //                 takePhoto(ImageSource.camera);
  //               },
  //               icon: Icon(
  //                 Icons.camera,
  //                 size: 50,
  //               ),
  //             ),
  //             IconButton(
  //               onPressed: () {
  //                 takePhoto(ImageSource.gallery);
  //               },
  //               icon: Icon(
  //                 Icons.photo,
  //                 size: 50,
  //               ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget imgFrom(){
    List<Widget> _boxContents = [
      IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: (){
            takePhoto(ImageSource.gallery);
          },
          icon: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6), shape: BoxShape.circle),
            child: Icon(
              CupertinoIcons.camera,
              color: Colors.green,
            ),
          )
      ),
       FittedBox(
        child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.circle),
        ),
      )
    ];

    return SizedBox(
      height: 350,
      child: DottedBorder(
        child: Container(
          child: Center(child: _boxContents[0]),
          decoration:
          BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(File(_imageFile!.path))))
        ),
        color: Colors.green,
        dashPattern: [5,3],
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
      ),
    );
  }

  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 99, maxWidth: 2000, maxHeight: 2000);
    setState(() {
      _imageFile = pickedFile!;
    });
  }
}
