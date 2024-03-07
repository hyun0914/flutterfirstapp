import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../layout/simple_bar_layout.dart';

// 참고사이트
// https://kyungsnim.net/126

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}
class _ProfileEditPageState extends State<ProfileEditPage> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  final _namecontroller = TextEditingController();

  String loginCheked = 'false';
  String get_id = '';
  String show_name = '';
  String checkName = '';

  void showToatst(String messsage) {
    Fluttertoast.showToast(
      msg: messsage,
      backgroundColor: Colors.black,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '프로필 변경',
      topIcon: null,
      children: [
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 20,),
              imageProfile(),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('현재닉네임: $show_name', style: TextStyle(fontSize: 17),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: nameText(),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if(checkName == 'false'){
                        showToatst('닉네임 변경완료.');
                        Navigator.pop(context);
                      }
                      else if(checkName == 'true'){
                        showToatst('사용중인 닉네임 입니다.');
                      }
                    },
                    child: const Text('변경하기'),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget imageProfile(){
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile == null ? const AssetImage('assets/images/chicken.jpg') : FileImage((File(_imageFile!.path))) as ImageProvider,
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: InkWell(
              onTap: (){
                // showModalBottomSheet(context: context,  builder: (builder) => bottomsheet());
                takePhoto(ImageSource.gallery);
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.black.withOpacity(0),
                size: 140,
              ),
            )
          )
        ],
      ),
    );
  }

  Widget nameText(){
    return TextFormField(
      controller: _namecontroller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: '닉네임',
      ),
    );
  }

  takePhoto(ImageSource source) async{
    final pickedFile  = await _picker.pickImage(source: source, imageQuality: 99, maxWidth: 2000, maxHeight: 2000,);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
