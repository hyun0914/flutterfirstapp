import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../layout/simple_bar_layout.dart';
import 'my_review_page.dart';

class MyReviewDetailsPage extends StatefulWidget {
  const MyReviewDetailsPage({Key? key}) : super(key: key);

  @override
  State<MyReviewDetailsPage> createState() => _MyReviewDetailsPageState();
}

class _MyReviewDetailsPageState extends State<MyReviewDetailsPage> {
  bool clickicon = false;
  bool clickicon2 = false;
  bool clickicon3 = false;
  bool clickicon4 = false;
  bool clickicon5 = false;

  String starNumber = '0';

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  final _contentcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '리뷰 수정페이지',
      topIcon: null,
      children: [
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          if(clickicon == false){
                            starNumber = '1';
                            clickicon = true;
                          } else if(clickicon == true){
                            clickicon = false;
                          }
                        });
                      },
                          icon: (clickicon==false)? Icon(Icons.star_border,color:Colors.black) : Icon(Icons.star,color:Colors.black)),
                      IconButton(onPressed: (){
                        setState(() {
                          if(clickicon == true){
                            if(clickicon2 == false){
                              starNumber = '2';
                              clickicon2 = true;
                            } else if(clickicon2 == true){
                              clickicon2 = false;
                            }
                          } else if(clickicon == false){

                          }
                        });
                      },
                          icon: (clickicon2==false)? Icon(Icons.star_border,color:Colors.black) : Icon(Icons.star,color:Colors.black)),
                      IconButton(onPressed: (){
                        setState(() {
                          if(clickicon == true && clickicon2 == true){
                            if(clickicon3 == false){
                              starNumber = '3';
                              clickicon3 = true;
                            } else if(clickicon3 == true){
                              clickicon3 = false;
                            }
                          } else if(clickicon == false && clickicon2 == false){

                          }
                        });
                      },
                          icon: (clickicon3==false)? Icon(Icons.star_border,color:Colors.black) : Icon(Icons.star,color:Colors.black)),
                      IconButton(onPressed: (){
                        setState(() {
                          if(clickicon == true && clickicon2 == true && clickicon3 == true){
                            if(clickicon4 == false){
                              starNumber = '4';
                              clickicon4 = true;
                            } else if(clickicon4 == true){
                              clickicon4 = false;
                            }
                          } else if(clickicon == false && clickicon2 == false && clickicon3 == false){

                          }
                        });
                      },
                          icon: (clickicon4==false)? Icon(Icons.star_border,color:Colors.black) : Icon(Icons.star,color:Colors.black)),
                      IconButton(onPressed: (){
                        setState(() {
                          if(clickicon == true && clickicon2 == true && clickicon3 == true && clickicon4 == true){
                            if(clickicon5 == false){
                              starNumber = '5';
                              clickicon5 = true;
                            } else if(clickicon5 == true){
                              clickicon5 = false;
                            }
                          } else if(clickicon == false && clickicon2 == false && clickicon3 == false && clickicon4 == false){

                          }
                        });
                      },
                          icon: (clickicon5==false)? Icon(Icons.star_border,color:Colors.black) : Icon(Icons.star,color:Colors.black)),
                    ],
                  ),
                  Text('닉네임'),
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
                        hintText: '내용',
                      ),
                    ),
                  ),
                  Container(
                      child: Image.asset('assets/hen.png'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            showModalBottomSheet(context: context,  builder: (builder) => bottomsheet());
                          },
                          child: Text('이미지 선택'),
                        ),
                      ),
                    ],
                  ),
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
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => MyReviewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('수정 하기', style: TextStyle(fontSize: 20, color: Colors.white))),
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => MyReviewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('삭제 하기', style: TextStyle(fontSize: 20, color: Colors.white))),
            ),
          ],
        )
      ],
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            '이미지 선택',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.photo,
                  size: 50,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
    });
  }
}
