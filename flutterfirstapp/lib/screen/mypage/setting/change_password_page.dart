import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../layout/simple_bar_layout.dart';


class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '비밀번호 변경',
      topIcon: null,
      children: [
        PasswordInput(),
      ],
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {

  String loginCheked = 'false';
  String get_id = '';

  final _pwcontroller = TextEditingController();
  final _pwcontrollerCheked = TextEditingController();

  bool checkPa = false;

  final _forkkey = GlobalKey<FormState>();

  void _tryValidation(){
    final isValid = _forkkey.currentState!.validate();
    if(isValid){
      _forkkey.currentState!.save();
    }
  }

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
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Column(
        children: [
          Form(
            key: _forkkey,
            child: TextFormField(
              controller: _pwcontroller,
              onChanged: (password) {},
              obscureText: true,
              validator: (value){
                Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,16}$';
                RegExp reqExp = new RegExp(pattern.toString());
                if(!reqExp.hasMatch(value!)){
                  return '특수문자, 숫자 포함 8자이상 16자 이내로 입력해주세요';
                } else{
                  checkPa = true;
                }
                return null;
              },
              decoration:
              InputDecoration(labelText: '새 비밀번호', helperText: ''),
            ),
          ),
          TextField(
            controller: _pwcontrollerCheked,
            onChanged: (password) {},
            obscureText: true,
            decoration:
            InputDecoration(labelText: '새 비밀번호 확인', helperText: ''),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                if(_pwcontroller.text !=''){
                  if(_pwcontroller.text == _pwcontrollerCheked.text){
                    if(checkPa == false){
                      _tryValidation();
                    } else if(checkPa == true){
                      showToatst('비밀번호 변경 완료');
                      Navigator.pop(context);
                    }
                  } else{
                    showToatst('비밀번호가 일치하지않습니다.');
                  }
                } else{
                  _tryValidation();
                  showToatst('변경할 비밀번호를 작성 해주세요.');
                }
              },
              child: Text('비밀번호 변경'),
            ),
          ),
        ],
      ),
    );
  }
}


