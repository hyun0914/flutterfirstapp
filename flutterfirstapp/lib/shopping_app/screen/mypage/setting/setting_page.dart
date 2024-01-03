import 'package:flutter/material.dart';
import 'package:flutterfirstapp/shopping_app/screen/mypage/setting/profile_edit_page.dart';
import 'package:flutterfirstapp/shopping_app/screen/mypage/setting/terms_of_service_page.dart';

import '../../main_page.dart';
import '../../layout/simple_bar_layout.dart';
import 'change_password_page.dart';



class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  String get_id = '';

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '설정',
      topIcon: null,
      children: [
        Expanded(
            child: ListView(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text('프로필 변경'),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileEditPage()),
                    );
                  },
                  enabled: get_id == 'null'? false : true,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    color: Colors.grey[300],
                    height: 3,
                  ),
                ),
                ListTile(
                  title: Text('비밀번호 변경'),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                    );
                  },
                  enabled: get_id == 'null'? false : true,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    color: Colors.grey[300],
                    height: 3,
                  ),
                ),
                // ListTile(
                //   title: Text('푸쉬 메세지/이메일/문자 수신'),
                //   trailing: Icon(Icons.check_box_outline_blank),
                //   onTap: () {
                //   },
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: 10,
                //     bottom: 10,
                //   ),
                //   child: Container(
                //     color: Colors.grey[300],
                //     height: 3,
                //   ),
                // ),
                ListTile(
                  title: Text('이용약관'),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsOfServicePage()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    color: Colors.grey[300],
                    height: 3,
                  ),
                ),
                get_id == 'null'?
                SizedBox():
                ListTile(
                  title: Text('로그아웃'),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainPage()),  (route) => false);
                  },
                ),
                get_id == 'null'?
                SizedBox():
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    color: Colors.grey[300],
                    height: 3,
                  ),
                ),
                ListTile(
                  title: Text('앱 버전'),
                  trailing: Text('1.0.4'),
                ),
              ],
            )
          ],
        ))
      ],
    );
  }
}
