import 'package:flutter/material.dart';
import 'dart:math';

class RandomRelatedScreen extends StatelessWidget {
  const RandomRelatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  // 참고사이트 https://m.blog.naver.com/chandong83/221950042761
                  onPressed: ()async{
                    dynamic getStr = await getRandom();
                    print(getStr);
                  },
                  child: const Text('랜덤 숫자 생성')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Future getRandom() async {
  dynamic randomStr = Random();
  //무조건 들어갈 문자종류(문자,숫자,특수기호)의 위치를 기억할 리스트
  dynamic leastCharacterIndex = [];
  // '+', '-', ' ' 사용하지 않을 아스키 문자
  dynamic skipCharacter = [0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F, 0x60];
  dynamic min = 0x30; // start ascii 사용할 아스키 문자의 시작
  dynamic max = 0x7A; // end ascii   사용할 아스키 문자의 끝
  dynamic dat = [];   // 저장용 리스트
  while(dat.length <= 5) { //무작위로 32개를 생성한다
    var tmp = min + randomStr.nextInt(max - min); //랜덤으로 아스키값 받기
    if(skipCharacter.contains(tmp)) { //사용하지 않을 아스키 문자인지 확인
      //print('skip ascii code $tmp.');
      continue;
    }
    //dat 리스트에 추가
    dat.add(tmp);
  }
  print(dat);
  return String.fromCharCodes(dat.cast<int>());
}