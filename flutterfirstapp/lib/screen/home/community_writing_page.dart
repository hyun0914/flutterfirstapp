import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../main_page.dart';
import '../layout/simple_bar_layout.dart';


class CommunityWritingPage extends StatefulWidget {
  const CommunityWritingPage({Key? key}) : super(key: key);

  @override
  State<CommunityWritingPage> createState() => _CommunityWritingPageState();
}

class _CommunityWritingPageState extends State<CommunityWritingPage> {

  String get_id = '';
  String get_name = '';

  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFile2 = [];

  final _titlecontroller = TextEditingController();
  final _contentcontroller = TextEditingController();

  void showToatst(String messsage) {
    Fluttertoast.showToast(
        msg: messsage,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM
    );
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _contentcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SimpleBarLayout(
      title: '글 올리기',
      topIcon: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) => MainPage()),  (route) => false);
              showToatst('글작성 완료');
            },
            child: Text('올리기', style: TextStyle(color: Colors.green)))
      ],
      children: [
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              wiringFroms(),
              SliverToBoxAdapter(
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: SizedBox(height:100, child: imgFrom()),
                      ),
                    ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SliverList wiringFroms(){
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
                      hintText: '제목을 입력해주세요',
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
                      hintText: '내용을 적어주세요',
                    ),
                  ),
                ),
              ],
            ),
          ]
        )
    );
  }

  Widget imgFrom(){
    List<Widget> boxContents = [
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
            child: const Icon(
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
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.circle),
          child: Text('+${(_imageFile2.length -4).toString()}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
      ),
    ];

    return SizedBox(
      height: 350,
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(2),
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(4,
              (index) => DottedBorder(
                color: Colors.green,
                dashPattern: const [5,3],
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: Container(
                  decoration: index <= _imageFile2.length-1
                  ? BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(_imageFile2[index].path))))
                  : null,
                  child: Center(
                    child: _imageFile2.length-1 == index?
                    Stack(
                      children: [
                        boxContents[index],
                        Positioned(child: InkWell(
                          onTap: (){
                            setState(() {
                              _imageFile2.removeAt(_imageFile2.length-1);
                            });
                          },
                          child: const Icon(Icons.close, color: Colors.green,)))
                      ]
                    )
                    :boxContents[index],
                  ),
                 ),
              ),
            ),
          ),
        );
    }

  takePhoto(ImageSource source) async{
    final List<XFile>? pickedFile2 = await _picker.pickMultiImage(imageQuality:99, maxWidth: 2000, maxHeight: 2000,);
    setState(() {
      _imageFile2 = pickedFile2!;
    });
  }
}
