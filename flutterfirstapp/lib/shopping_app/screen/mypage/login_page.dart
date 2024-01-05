import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../layout/simple_bar_layout.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool obscureText = true;

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
                SizedBox(height: 9,),
                Image.asset('assets/images/hen.png', width: 150, height: 200,),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    controller: _idcontroller,
                    onChanged: (email) {},
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: '이메일', helperText: '', border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: TextField(
                    controller: _pwcontroller,
                    onChanged: (password) {},
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: '비밀번호', helperText: '', border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if(obscureText) {
                              obscureText = false;
                            } else {
                              obscureText = true;
                            }
                          });
                        },
                        icon: obscureText == true? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                      )
                    ),
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
                    backgroundColor: Colors.green),
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
