import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mailer/mailer.dart';

import '../layout/simple_bar_layout.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

var _isChekedall = false;
var _isCheked2 = false;
var _isCheked3 = false;
var _isCheked4 = false;

class _SignUpPageState extends State<SignUpPage> {

  final _idcontroller = TextEditingController();
  final _pwcontroller = TextEditingController();
  final _pwcontrollerCheked = TextEditingController();
  final _namecontroller = TextEditingController();
  final _numbercheckcontroller = TextEditingController();

  String userEmail = '';

  bool checkId = false;
  bool checkPa = false;
  bool checkEmail = false;

  String checkEmailID = '';
  String checkName = '';

  final _forkkey = GlobalKey<FormState>();

  void _tryValidation(){
    final isValid = _forkkey.currentState!.validate();
    if(isValid){
      _forkkey.currentState!.save();
    }
  }

  emailChek(){
    mailCheck();
    showDialog(context: context, builder: (_) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('인증 번호 입력'),
          TextField(
            controller: _numbercheckcontroller,
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            }, child: Text('취소')),
        TextButton(
            onPressed: (){
              print(rand);
              if(rand.toString() == _numbercheckcontroller.text){
                showToatst('인증 완료');
                checkEmail = true;
                Navigator.pop(context);
              }
            }, child: Text('확인')),
      ],
    ));
  }

  void showToatst(String messsage) {
    Fluttertoast.showToast(
        msg: messsage,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
    );
  }

  var rand = Random().nextInt(10000);

  mailCheck() async {

    String username = 'chorokdosiat@gmail.com';
    String password = 'ykrolvyydbaejdht';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, '${username}')
      ..recipients.add('chorokdosiat@gmail.com')
      ..ccRecipients.add(_idcontroller.text)
      ..subject = "이메일인증 번호"
      ..html = "<p>${rand}</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      showToatst('인증번호 발송완료');
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e.message);
    }
  }

  @override
  void dispose() {
    _isChekedall = false;
    _isCheked2 = false;
    _isCheked3 = false;
    _isCheked4 = false;
    _idcontroller.dispose();
    _pwcontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '회원가입',
      topIcon: null,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Form(
                      key: _forkkey,
                      child: Column(
                        children: [
                          textField(
                              controller: _idcontroller,
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? value) {
                                Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp reqExp = new RegExp(pattern.toString());
                                if(!reqExp.hasMatch(value!)){
                                  return '이메일 형식으로 작성해주세요';
                                }else{
                                  checkId = true;
                                  return null;
                                }
                              },
                              onSaved: (String? newValue) {  userEmail = newValue!; },
                            labelText: '이메일',
                            obscureText: null,
                            inputFormatters: [],
                          ),
                          SizedBox(height: 8,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green
                              ),
                              onPressed: (){
                                if(_idcontroller.text == ''){
                                  showToatst('이메일을 작성해주세요');
                                } else {
                                  if(checkEmailID == ''){
                                    showToatst('회원가입 가능한 이메일 입니다.');
                                    emailChek();
                                  } else {
                                    if(checkEmailID == 'false'){
                                      showToatst('회원가입 가능한 이메일 입니다.');
                                      emailChek();
                                    }else if(checkEmailID == 'true'){
                                      showToatst('이미 회원가입한 이메일 입니다.');
                                    }
                                  }
                                }
                              },
                              child: Text('이메일 인증하기'),
                            ),
                          ),
                          SizedBox(height: 8,),
                          textField(
                            controller: _pwcontroller,
                            keyboardType: null,
                            validator: (String? value) {
                              // Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8}$';
                              // RegExp reqExp = new RegExp(pattern.toString());
                              if(value.toString().length<8){
                                return '특수문자, 숫자 포함 8자이상 으로 입력해주세요';
                              } else{
                                checkPa = true;
                              }
                              return null;
                            },
                            onSaved: null,
                            labelText: '비밀번호',
                            obscureText: true, inputFormatters: [],
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            controller: _pwcontrollerCheked,
                            onChanged: (password) {},
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: '비밀번호 확인',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: Colors.green)
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          textField(
                            controller: _namecontroller,
                            keyboardType: null,
                            validator: (String? value) {
                              if(value.toString().length >1){
                              }else{
                                return '2자 이상으로 작성해주세요';
                              }
                              return null;
                            },
                            onSaved: null,
                            labelText: '별명(중복불가,한글만 사용가능)',
                            obscureText: true,
                            inputFormatters: [ FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]')), ],
                          ),
                          SizedBox(height: 8,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.green
                              ),
                              onPressed: (){
                                if(checkName == ''){
                                  showToatst('사용가능한 닉네임 입니다.');
                                } else {
                                  if(checkName == 'false'){
                                    showToatst('사용가능한 닉네임 입니다.');
                                  }else if(checkName == 'true'){
                                    showToatst('사용중인 닉네임 입니다.');
                                  }
                                }
                              },
                              child: Text('닉네임 중복체크'),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CheckboxView(),
                  const SizedBox(height: 25,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        if(_idcontroller.text !='' && _pwcontroller.text !='' && _namecontroller.text  !=''){
                         if(checkEmail == true){
                           if(_pwcontroller.text == _pwcontrollerCheked.text){
                             if(_isChekedall == true && _isCheked2 == true && _isCheked3 == true && _isCheked4 == true){
                               if(checkId == false || checkPa == false){
                                 _tryValidation();
                               } else if(checkId == true && checkPa == true){
                                 print(_idcontroller.text +
                                     '      ' +
                                     _pwcontroller.text +
                                     '      ' +
                                     _namecontroller.text);
                                 showToatst('회원가입 완료되었습니다. 로그인 후 서비스를 이용해주세요');
                                 Navigator.pop(context);
                               }
                             }else {
                               showToatst('약관에 동의해주세요');
                             }
                           }else{
                             showToatst('비밀번호가 일치하지않습니다.');
                           }
                         }else{
                           showToatst('이메일인증이 아직 안됬습니다.');
                         }
                        }else {
                          _tryValidation();
                          showToatst('빈칸이 있습니다.');
                        }
                      },
                      child: const Text('회원가입 완료'),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
          ),
        )
      ],
    );
  }
}

Widget textField({
    required TextEditingController? controller,
    required TextInputType? keyboardType,
    required FormFieldValidator<String>? validator,
    required FormFieldSetter<String>? onSaved,
    required String? labelText,
    required bool? obscureText,
    required List<TextInputFormatter>? inputFormatters,
    }) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    decoration: InputDecoration(
      labelText: labelText,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.green)
      ),
    ),
    obscureText: obscureText ?? false,
    inputFormatters: inputFormatters,
  );
}

class CheckboxView extends StatefulWidget {
  const CheckboxView({Key? key}) : super(key: key);

  @override
  State<CheckboxView> createState() => _CheckboxViewState();
}

class _CheckboxViewState extends State<CheckboxView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 45,
                  ),
                  child: Text('약관 전체동의'),
                )),
            Expanded(
              flex: 1,
              child: Checkbox(
                  value: _isChekedall,
                  onChanged: (value) {
                    setState(() {
                      if (_isChekedall == false) {
                        _isChekedall = true;
                        _isCheked2 = true;
                        _isCheked3 = true;
                        _isCheked4 = true;
                      } else if (_isChekedall == true) {
                        _isChekedall = false;
                        _isCheked2 = false;
                        _isCheked3 = false;
                        _isCheked4 = false;
                      }
                    });
                  }),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 45,
                  ),
                  child: Text('만 14세 이상입니다.(필수)'),
                )),
            Expanded(
              flex: 1,
              child: Checkbox(
                  value: _isCheked2,
                  onChanged: (value) {
                    setState(() {
                      if (_isCheked2 == false) {
                        _isCheked2 = true;
                      } else if (_isCheked2 == true) {
                        _isCheked2 = false;
                      }
                    });
                  }),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 45,
                  ),
                  child: Text('이용약관(필수)'),
                )),
            Expanded(
              flex: 1,
              child: Checkbox(
                  value: _isCheked3,
                  onChanged: (value) {
                    setState(() {
                      if (_isCheked3 == false) {
                        _isCheked3 = true;
                      } else if (_isCheked3 == true) {
                        _isCheked3 = false;
                      }
                    });
                  }),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 45,
                  ),
                  child: Text('개인정보수집 및 이용동의(필수)'),
                )),
            Expanded(
              flex: 1,
              child: Checkbox(
                  value: _isCheked4,
                  onChanged: (value) {
                    setState(() {
                      if (_isCheked4 == false) {
                        _isCheked4 = true;
                      } else if (_isCheked4 == true) {
                        _isCheked4 = false;
                      }
                    });
                  }),
            )
          ],
        ),
      ],
    );
  }
}

class CheckValidate{
  String validateEmail(FocusNode focusNode, String value){
    if(value.isEmpty){
      focusNode.requestFocus();
      return '이메일을 입력하세요.';
    }else {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern.toString());
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();	//포커스를 해당 textformfield에 맞춘다.
        return '잘못된 이메일 형식입니다.';
      }else{
        return '';
      }
    }
  }

  String validatePassword(FocusNode focusNode, String value){
    if(value.isEmpty){
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    }else {
      Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
      RegExp regExp = new RegExp(pattern.toString());
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();
        return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
      }else{
        return '';
      }
    }
  }

}
