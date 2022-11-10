import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfirstapp/screen/mypage/signup_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../layout/simple_bar_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idcontroller = TextEditingController();
  final _pwcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void showToatst(String messsage) {
      Fluttertoast.showToast(
          msg: messsage,
          backgroundColor: Colors.black,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }

    return SimpleBarLayout(
      title: '로그인',
      topIcon: null,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextField(
                    controller: _idcontroller,
                    onChanged: (email) {},
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        InputDecoration(labelText: '이메일', helperText: ''),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextField(
                    controller: _pwcontroller,
                    onChanged: (password) {},
                    obscureText: true,
                    decoration:
                        InputDecoration(labelText: '비밀번호', helperText: ''),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: Colors.green),
                    onPressed: () {
                    },
                    child: Text('로그인'),
                  ),
                ),
                SizedBox(height: 14,),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
                  },
                  child: Text(
                    '이메일로 간단하게 회원가입하기',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
