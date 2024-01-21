import 'package:flutter/material.dart';

class Test04FirstView extends StatelessWidget {
  const Test04FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => showSheet(context),
            child: Text('showModalBottomSheet')
          ),
        ],
      ),
    );
  }
}

// 참고사이트
// flutter showModalBottomSheet height
// https://stackoverflow.com/questions/53311553/how-to-set-showmodalbottomsheet-to-full-height

// Wrap
// https://velog.io/@qkrtnfks128/showModalBottomSheet-%EC%9E%90%EC%8B%9D-%EB%86%92%EC%9D%B4%EB%A7%8C%ED%81%BC-height

// flutter showmodalbottomsheet 모서리 둥글게
// https://cyj893.github.io/flutter/Flutter8/

// flutter showmodalbottomsheet textfield scroll
// https://www.youtube.com/watch?v=VLQdvUS2zeY

// TextField 넣었을때 TextField클릭 시 키보드따라 화면 위로 이동 되게 할려면
// isScrollControlled: true, padding: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),

// 스크롤 하고 싶으면 ListView, SingleChildScrollView 등 을 상위 widget 으로 한다.

Future showSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: false, // bottomSheet의 높이를 full로 설정 여부 (기본 false)
    isDismissible: true, // showModalBottomSheet 외 영역 클릭시 닫히지 않게 설정 여부
    // 모서리 둥글게 하기
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    builder: (context) {
      // 높이의 조절을 내용물에 맞게 자동으로 조절한다.
      return Container(
        padding: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          children: [
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: '입력해주세요',
              ),
            ),
            Container(
              width: 500,
              height: 500,
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.lightGreen,
            ),
          ],
        ),
      );
    }
  );
}
