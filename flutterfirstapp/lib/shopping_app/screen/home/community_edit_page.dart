import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../main_page.dart';
import '../layout/simple_bar_layout.dart';

class CommunityEditPage extends StatefulWidget {
  const CommunityEditPage({Key? key})
      : super(key: key);

  @override
  State<CommunityEditPage> createState() => _CommunityEditPageState();
}

final ImagePicker _picker = ImagePicker();
List<XFile> _imageFile2 = [];

final _titlecontroller = TextEditingController();
final _contentcontroller = TextEditingController();

class _CommunityEditPageState extends State<CommunityEditPage> {

  String get_id = '';

  void showToatst(String messsage) {
    Fluttertoast.showToast(
        msg: messsage,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(title: '커뮤니글 수정', topIcon: null, children: [
      Expanded(
        child:
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            wiringsFrom(get_title: '제목', get_context: '내용',),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: SizedBox(height:100, child: imagesFrom()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        child: ElevatedButton(
                            onPressed: (){
                              if(_imageFile2.length == 0){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainPage()),  (route) => false);
                                showToatst('글수정 완료');
                              } else if(_imageFile2.length > 0){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainPage()),  (route) => false);
                                showToatst('글수정 완료');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green
                            ),
                            child: Text('글 수정', style: TextStyle(fontSize: 20, color: Colors.white),)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class wiringsFrom extends StatelessWidget {
  final String get_title;
  final String get_context;
  const wiringsFrom({
    required this.get_title,
    required this.get_context,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return wiringFrom(context);
  }

  SliverList wiringFrom(BuildContext context){
    _titlecontroller.text = '${get_title}';
    _contentcontroller.text = '${get_context}';
    return SliverList(
        delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 2),
                    child: TextField(
                      controller: _titlecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
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
                      ),
                    ),
                  ),
                ],
              ),
            ]
        )
    );
  }
}



class imagesFrom extends StatefulWidget {
  const imagesFrom({Key? key}) : super(key: key);

  @override
  State<imagesFrom> createState() => _imagesFromState();
}

class _imagesFromState extends State<imagesFrom> {
  @override
  Widget build(BuildContext context) {
    return imgFrom();
  }

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
      Container(),
      Container(),
      _imageFile2.length <=4
          ? Container()
          : FittedBox(
        child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.circle),
          child: Text('+${(_imageFile2.length -4).toString()}',
            style: Theme.of(context).textTheme.subtitle2?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
      )
    ];

    return SizedBox(
      height: 350,
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(2),
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(
          4,
              (index) => DottedBorder(
            child: Container(
              child: Center(child: _boxContents[index]),
              decoration: index <= _imageFile2.length-1
                  ? BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(_imageFile2[index].path))))
                  : null,
            ),
            color: Colors.green,
            dashPattern: [5,3],
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  takePhoto(ImageSource source) async{
    // final pickedFile  = await _picker.getImage(source: source);
    //final pickedFile  = await _picker.pickImage(source: source);
    final List<XFile>? pickedFile2 = await _picker.pickMultiImage();

    setState(() {
      // _imageFile = pickedFile!;
      _imageFile2 = pickedFile2!;
    });
  }
}

