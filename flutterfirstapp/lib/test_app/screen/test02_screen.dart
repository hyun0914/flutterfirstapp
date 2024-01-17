import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/shake_icon.dart';

// 위젯 화면 fill로 하는법
// Row 위젯으로 감싼 후 child 위젯을 Expanded 위젯으로 감싼다
// Column 위젯으로 감싼 후 crossAxisAlignment: CrossAxisAlignment.stretch를 준다.
// width: double.infinity,
// height: double.infinity,
// width: MediaQuery.of(context).size.width,


// 색상 지정법
// 참고사이트 https://bigstar-vlog.tistory.com/68
// color: Colors.green;
// color: Color.fromARGB();
// color: Color.fromRGBO();
// color: Color(0xff123456);

// 참고사이트 https://sikk.tistory.com/19
final textController = TextEditingController(text: '초기값텍스트');

class Test02Screen extends StatelessWidget {
  const Test02Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

    return Scaffold(
      extendBody: true,
      // 참고사이트 https://stackoverflow.com/questions/69001896/how-to-hide-floatingactionbutton-under-keyboard-and-not-textformfield-in-flutter
      // floatingActionButton 키보드 뒤로 가는 설정 false 이면 뒤로간다
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(onPressed: () {  },),
      // 참고 영상 https://www.youtube.com/watch?v=MW-KVmnXuiE
      // BottomAppBar 위젯 shape: CircularNotchedRectangle(), notchMargin: 7, 추가 하면 notched가 된다.
      // 뒤에 부분 표시할려면 Scaffold 위젯의 extendBody: true, 추가한다.
      // 중앙 이동
      floatingActionButtonLocation:
        // floatingActionButton 키보드 뒤로 숨기는 방법
        //MediaQuery.of(context).viewInsets.bottom != 0 ? null :
        FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home),
            Icon(Icons.access_alarms),
            Icon(Icons.edit),
          ],
        )
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ShakeIcon(
                  shakeMode: ShakeEnum.awhile,
                  shakeWidth: 3,
                  duration: 1000,
                  child: Icon(Icons.access_alarms),
                ),

                // 아이콘 버튼 클릭시 나오는 효과 없애기
                IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: (){
                    debugPrint('클릭 됨');
                  },
                  icon: const Icon(Icons.add_circle)
                ),

                // 참고사이트 https://velog.io/@haram2/Tooltip-class
                GestureDetector(
                  onTap: () => tooltipKey.currentState?.ensureTooltipVisible(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Tooltip(
                      key: tooltipKey,
                      message: 'Tooltip 메세지 입니다.',
                      triggerMode: TooltipTriggerMode.manual,
                      showDuration: const Duration(seconds: 1),
                      height: 40,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      textStyle: const TextStyle(fontSize: 24,),
                      child: const Text('Tooltip 테스트'),
                    ),
                  ),
                ),

                // 비동기로 하는법 onTap: () async { await Clipboard.setData(ClipboardData(text: "비동기 글자 복사")); },
                // 참고사이트
                // https://velog.io/@tororae/Flutter-%ED%81%B4%EB%A6%BD%EB%B3%B4%EB%93%9CClipBoard-%EC%97%90-%EA%B8%80-%EB%B3%B5%EC%82%AC%ED%95%98%EA%B8%B0
                GestureDetector(
                  onTap: () => Clipboard.setData(const ClipboardData(text: '텍스트 복사 하기')),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      color: Colors.lightGreen,
                      child: const Text('글자 복사하기', style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ),

                // 정렬 종류
                // topLeft
                // topCenter
                // topRight
                // centerLeft
                // center
                // centerRight
                // bottomLeft
                // bottomCenter
                // bottomRight
                // 참고사이트 https://naman-develop.tistory.com/8
                const Align(alignment: Alignment.topLeft, child: Text('중앙 정렬')),

                // 그림자 설정
                // color 그림자 색상
                // blurRadius 그림자 효과를 선명도(0일 수록 그림자선이 선명해진다)
                // spreadRadius 그림자효과의 반경 설정(값이 높을 수록 넓어진다)
                // offset x,y의 offset값으로 x 값이 커질수록 오른쪽으로 y값이 커질수록 아래로 이동하여 표시된다
                // 참고사이트 https://gloria94.tistory.com/44
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 149,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.08),
                              spreadRadius: 0,
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            )
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(255, 216, 67, 1),
                              Color.fromRGBO(238, 175, 11, 1),
                            ],
                          )
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        width: 140,
                        height: 149,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.08),
                              spreadRadius: 0,
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            )
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(255, 163, 77, 1),
                              Color.fromRGBO(238, 132, 34, 1),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),

                Image.asset('assets/images/icicles1280.jpg', width: 200, height: 170,),

                // ExpansionTile 위젯을 펼쳤을 때 위아래에 줄이 있다.
                // Theme(
                //   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                //   child: ExpansionTile()
                // ),
                // 이렇게 하면 없어진다.
                // 참고사이트 (flutter expansiontile no border)
                // https://stackoverflow.com/questions/64123839/flutter-remove-border-expansion-tile

                // ExpansionTile위젯에 모서리를 둥글게 하는법
                // ClipRRect, Container 위젯으로 감싼후 borderRadius를 지정한다.
                // ClipRRect(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                //   child: ExpansionTile(),
                // ),
                // 참고사이트(expansiontile border radius flutter)
                // https://stackoverflow.com/questions/65331151/how-to-apply-rounded-borders-to-expanded-expansiontile-in-flutter
                const ExpansionTile(
                  initiallyExpanded: true, // 처음 화면들어왔을때 펼친상태로 할지 말지 설정
                  collapsedBackgroundColor: Colors.amber, // 닫혔을 때 색상
                  backgroundColor: Colors.lightGreen, // 열렸을 때 색상
                  collapsedIconColor: Color.fromRGBO(51, 51, 51, 1), // 닫혔을 때 아이콘 색상
                  iconColor: Color.fromRGBO(51, 51, 51, 1), // 열렸을 때 아이콘 색상
                  title: Text('제목',  style: TextStyle(fontSize: 20, ), ),
                  shape:  RoundedRectangleBorder(  // 하위 목록이 확장될 때 타일의 테두리 모양입니다
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  children: [ Text('내용부분 입니다.'), ]
                ),

                // 기존 위젯에서 벗어나게 하는법
                // clipBehavior: Clip.none,
                // 참고사이트 https://develop-designer.tistory.com/44

                // Positioned 위치 고정 하는 법
                // alignment: AlignmentDirectional.center,
                // 참고사이트
                // https://stackoverflow.com/questions/50819354/flutter-position-stack-widget-in-center
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  // Stack 참고사이트 https://ahang.tistory.com/24
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: 300,
                        height: 100,
                        color: Colors.grey,
                      ),
                      Positioned(
                        width: 100,
                        height: 50,
                        child: Container(
                          color: Colors.lightGreen,
                        )
                      )
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: const BoxDecoration(
                      // Border를 하단에만 줄 표시하기
                      // 참고사이트
                      // https://stackoverflow.com/questions/47423297/how-can-i-add-a-border-to-a-widget-in-flutter
                      // https://googleflutter.com/flutter-container-border-left-right-top-bottom/
                      border: Border(
                        bottom: BorderSide(color: Colors.red, width: 5.3),
                      ),
                      color: Colors.teal,
                    ),
                  ),
                ),

                // 이미지파일을 아이콘으로 사용하고 싶을 때 ImageIcon위젯을 사용하면 된다.
                // 참고사이트 https://www.woolha.com/tutorials/flutter-using-imageicon-widget-examples
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ImageIcon(AssetImage('assets/images/hen.png'), size: 60,),
                      // 투명도 값 넣기 withOpacity(0.2)
                      // 참고사이트 https://yj95.tistory.com/220
                      Icon(Icons.camera, color: Colors.black.withOpacity(0.2), size: 60,),
                    ],
                  ),
                ),

                // Text 글자를 일정길이를 넘어서면 ... 표시하는 법
                // 참고사이트
                // https://velog.io/@gunwng123/Text-%EC%9C%84%EC%A0%AF%EC%97%90-%ED%91%9C%ED%98%84%ED%95%98%EA%B3%A0%EC%9E%90-%ED%95%98%EB%8A%94-String%EC%9D%98-%EA%B8%B8%EC%9D%B4%EA%B0%80-%EA%B8%B4-%EA%B2%BD%EC%9A%B0-%EC%B2%98%EB%A6%AC-%EB%B0%A9%EB%B2%95
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  width: 150,
                  child: const Text('제목테스트123456789101112131415',
                  style: TextStyle(color: Colors.black,),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  )
                ),

                GestureDetector(
                  onTap: (){
                    debugPrint('빈 영역 클릭');
                    // Scaffold.of(context).hideCurrentSnackBar(); 중복 방지
                    // 참고사이트 https://dopble2k.tistory.com/4
                    ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('빈 영역 클릭')),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.transparent,
                    ),
                    child: const Text('클릭 테스트'),
                  ),
                ),
                const SizedBox(height: 20,),

                // 자식의 고유 높이에 맞게 자식 크기를 조정하는 위젯
                IntrinsicHeight(
                  child: Container(
                    height: 200,
                    color: Colors.black,
                  ),
                ),
                // 자식의 최대 고유 너비에 맞게 자식 크기를 조정하는 위젯
                IntrinsicWidth(
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
